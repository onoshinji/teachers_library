class PostsController < ApplicationController
  require 'aws-sdk'
  before_action :login_user, only:  [:new, :create, :edit, :update, :show,
                                    :destroy, :worksheets, :findings, :plans, :about]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :download]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "ファイルを投稿しました"
        # ContactMailer.contact_mail(@post).deliver
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @post.views_count += 1
    @post.save
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  def worksheets
    @posts = Post.where(kind: 'ワークシート').page(params[:page]).per(5)
    main_search
    tag_search
    sort
  end

  def findings
    @posts = Post.where(kind: '所見例').page(params[:page]).per(5)
    main_search
    tag_search
    sort
  end

  def plans
    @posts = Post.all.page(params[:page]).per(5) #ここでは、テストのために、Post.allを仮で入れてすべての種類のファイルを表示するようにしている。実装では下記の表記になおす
    # @posts = Post.where(kind: '指導案')
    main_search
    tag_search
    sort
  end
  def about
  end

  # S3からのダウンロード
  def download
    bucket = 'teachers-production' # S3バケット名
    key = "#{@post.filename}" #S3のファイル名
    client = Aws::S3::Client.new(
      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region: 'ap-northeast-1'
      )
      data = client.get_object(:bucket => bucket, :key => key).body
    # data = open(URI.encode(@post.image.url))
    send_data data.read, disposition: 'attachment',
    filename: @post.file_name, type: @post.content_type
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,
      :content,
      :image,
      :image_cache,
      :grade,
      :subject,
      :unit,
      :views_count,
      :url,
      :kind,
      :ms_office,
      { tag_ids: [] }
    )
  end
  # 検索機能
  def main_search
    if params[:grade_search].present?
      @posts = @posts.grade_search(params[:grade_search])
      if params[:subject_search].present? && params[:unit_search].present?
        @posts = @posts.subject_search(params[:subject_search]).unit_search(params[:unit_search])
      elsif params[:subject_search].present?
        @posts = @posts.subject_search(params[:subject_search])
      elsif params[:unit_search].present?
        @posts = @posts.unit_search(params[:unit_search])
      end
    end
  end

  # タグ検索機能
  def tag_search
    @posts = @posts.joins(:tags).where(tags: { id: params[:tag_id] }) if params[:tag_id].present?
  end
  # ソート機能
  def sort
    if params[:sort].present?
      if params[:sort] == 'new_arrival'
        @posts = @posts.order(created_at: :DESC)
      elsif params[:sort] == 'view'
        @posts = @posts.order(views_count: :DESC)
      end
    end
  end
end

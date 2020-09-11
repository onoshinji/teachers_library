class PostsController < ApplicationController
  before_action :login_user, only:  [:new, :create, :edit, :update, :show,
                                    :destroy, :worksheets, :findings, :plans, :about]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :download, :file_download]
  before_action :ensure_correct_user, only:[:edit,:destroy,]
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
        redirect_to post_path(@post), notice: "ファイルを投稿しました"
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
      redirect_to post_path(@post), notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def show
    @tag_count = @post.tags.count
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
    @posts = Post.where(kind: '所見例').page(params[:page]).per(10)
    main_search
    tag_search
    sort
  end

  def plans
    @posts = Post.where(kind: '指導案').page(params[:page]).per(5)
    main_search
    tag_search
    sort
  end
  def about
  end

  # S3からの画像ダウンロード
  def download
    url = URI.encode(@post.image.url)
    data_path = open(url)
    send_data data_path.read, disposition: 'attachment',
    filename: "#{@post.image_name}", type: @post.image_type
  end

  def file_download
    # ファイル種類によって、処理を分ける
    if @post.ms_office.file.extension == "csv"
      url = URI.encode(@post.ms_office.url)
      data_path = open(url)
      send_data data_path.read, disposition: 'attachment',
      filename: "download_file.csv", type: @post.file_type
    elsif @post.ms_office.file.extension == "pdf"
      url = URI.encode(@post.ms_office.url)
      data_path = open(url)
      send_data data_path.read, disposition: 'attachment',
      filename: "download_file.pdf", type: @post.file_type
    end
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
      if params[:sort] == 'new'
        @posts = @posts.order(created_at: :DESC)
      elsif params[:sort] == 'view'
        @posts = @posts.order(views_count: :DESC)
      elsif params[:sort] == 'old'
        @posts = @posts.order(created_at: :ASC)
      end
    end
  end
end

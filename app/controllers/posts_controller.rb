class PostsController < ApplicationController
  before_action :login_user, only:  [:new, :create, :edit, :update, :show,
                                    :destroy, :worksheets, :about]
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
        redirect_to post_path(@post), success: "ファイルを投稿しました"
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
      redirect_to post_path(@post), success: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def show
    @tag_count = @post.tags.count
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @post.views_count += 1
    @post.save
    @like = Like.new
  end

  def destroy
    @post.destroy
    redirect_to posts_path, danger: "投稿を削除しました"
  end

  def worksheets
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:tags, :favorites).page(params[:page]).per(24)
      if params[:sort] == 'new'
        @posts = @posts.order(created_at: :DESC)
      elsif params[:sort] == 'view'
        @posts = @posts.order(views_count: :DESC)
      elsif params[:sort] == 'old'
        @posts = @posts.order(created_at: :ASC)
      elsif params[:sort] == 'favorites'
        @posts = @posts.select('posts.*', 'count(favorites.id) AS favs')
                       .left_joins(:favorites)
                       .group('posts.id')
                       .order('favs desc')
      end
  end

  # S3からの画像ダウンロード
  def download
    url = URI.encode(@post.image.url)
    data_path = open(url)
    send_data data_path.read, disposition: 'attachment',
    type: @post.image_type
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

  def privacy_policy
  end

  def terms_of_use
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

  def search_params
    params.require(:q).permit(:unit_cont)
  end
end

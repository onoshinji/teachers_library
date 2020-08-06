class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
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
  # 「今ログインしているユーザーが、そのブログをお気に入り登録しているかどうか」を判断するための処理をしています。
  # find_by(blog_id: @blog.id) で、その全抽出したFavoriteのレコードの中に、このブログのidが存在していれば（このブログがお気に入りに登録されていれば）、そのFavoriteのレコード（user_idとblog_id）を@favoriteに代入します。
  # このブログのidが存在しなければ（このブログがお気に入りに登録されていなければ）、@favoriteにnilを代入します（find_byメソッドは、条件に一致するものがない場合には、nilを返します）。
  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  def post_params
    params.require(:post).permit(:title,
                                 :content,
                                 :image,
                                 :image_cache,
                                 :grade,:subject,
                                 :unit,
                                 :views_count,
                                 :url,
                                )
  end

  def worksheets
  end

  def findings
  end

  def plans
  end
  def set_post
    @post = Post.find(params[:id])
  end
end

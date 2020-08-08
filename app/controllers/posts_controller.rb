class PostsController < ApplicationController
  before_action :login_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
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
                                )
  end
  def about
  end
  def worksheets
  end

  def findings
  end

  def plans
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

end

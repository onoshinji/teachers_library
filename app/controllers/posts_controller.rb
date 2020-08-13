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
                                 :url,:kind,
                                 { tag_ids: [] }
                                )
  end
  def about
  end

  def worksheets
    @posts = Post.where(kind: 'ワークシート')
  end

  def findings
    @posts = Post.where(kind: '所見例')
  end

  def plans
    @posts = Post.all
    # @posts = Post.where(kind: '指導案')
    # 検索機能
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
    # タグ検索
    @posts = @posts.joins(:tags).where(tags: { id: params[:tag_id] }) if params[:tag_id].present?
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

end

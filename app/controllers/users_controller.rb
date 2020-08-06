class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: "ユーザーを登録しました"
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報を更新しました"
    else
      render :edit
    end
  end
  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email,:image,:image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

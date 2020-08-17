module ApplicationHelper
  def login_user
    unless user_signed_in?
      redirect_to root_path, notice: 'ログインしてください'
    end
  end
end

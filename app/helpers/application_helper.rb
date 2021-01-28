module ApplicationHelper
  def login_user
    unless user_signed_in?
      redirect_to root_path, notice: 'ログインしてください'
    end
  end

  # 追記 現在ログインしているユーザーと投稿者が合っていなければ編集できない
  def ensure_correct_user
    unless current_user.id == @post.user_id #IDと比較する。ユーザーIDと比較する
      redirect_to posts_path, notice: "あなたが投稿したもの以外は編集、削除できません。"
    end
  end

  def admin_user?
    if current_user.admin == false
      redirect_to root_path, notice: "あなたは管理者ではありません"
    end
  end

  def page_title(page_title = '')
    base_title = '先生の教材'
    # 三項演算子による記述。?以降に真の場合の表記。:以降に偽の表記。
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end

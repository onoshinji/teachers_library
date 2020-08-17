
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :check_guest, only: %i[update destroy]

  def new
    super
  end
  #
  def create
    super
  end

  def edit
    super
  end
  #
  def update
    super
  end

  def destroy
    super
  end
  #
  def cancel
    super
  end
  #
  protected
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end
  #
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
  
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは変更・削除できません。'
    end
  end
end

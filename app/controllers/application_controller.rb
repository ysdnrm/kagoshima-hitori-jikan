class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path #トップページ
  end

  def after_sign_out_path_for(resource)
    root_path #トップページ
  end

  def after_sign_up_path_for(resource)
    root_path #トップページ
  end

  protected
  # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

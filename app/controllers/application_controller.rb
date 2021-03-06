class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?

  # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # user edit時にname, imageというキーのパラメーターを追加で許可する
  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

end

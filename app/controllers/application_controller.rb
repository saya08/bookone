class ApplicationController < ActionController::Base


#全てのページでログイン認証が必要
#before_actionで、applicationコントローラのアクションが実行される前に実行。
#authenticate_user!でログイン認証されていなければrootパスへリダイレクトする

  protect_from_forgery with: :exception
#一家はデフォルトで用意されてないカラムを追加した場合必要なもの
# deviseを利用する機能（ユーザ登録、ログイン認証など）の場合、
# configure_permitted_parametersを実行する。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
# configure_permitted_parametersが実行されると、
# devise_parameter_sanitizer.permitで
# nameのデータ操作を許可するアクションメソッドを指定。
# 今回の場合、ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可される。

# ログインをユーザ名とパスワードでできるようにする。
  def configure_permitted_parameters
    #strong parametersを設定し、nameを許可
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :name,:introduction])
  end


  private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)

      user_path(current_user)
  end

end

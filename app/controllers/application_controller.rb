class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    # [abstract] devise用のストロングパラメータの指定を行うメソッド
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end

    def authorization

    end
end

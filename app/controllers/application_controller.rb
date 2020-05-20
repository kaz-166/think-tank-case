class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    class Forbidden < ActionController::ActionControllerError; end
    class IpAddressRejected < ActionController::ActionControllerError; end
    
    rescue_from Exception, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActionController::RoutingError, with: :rescue404
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404

    def routing_error
        raise ActionController::RoutingError, params[:path]
    end

    # [abstract] devise用のストロングパラメータの指定を行うメソッド
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
    end

    def authorization

    end

    private
    def rescue403(e)
      @exception = e
      render '/errors/forbidden', status: 403
    end
  
    def rescue404(e)
      @exception = e
      render '/errors/not_found', status: 404
    end
  
    def rescue500(e)
      @exception = e
      render '/errors/internal_server_error', status: 500
    end
end




class ApplicationController < ActionController::Base
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?

    
    def set_locale
        # if params[:locale] is nil then I18n.default_locale will be used
        I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
        session[:locale] = I18n.locale
     end
    
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
        # format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
        end
    end
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username,
        :first_name, :last_name, :phone_number, :admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :phone_number, :admin])
    end
end

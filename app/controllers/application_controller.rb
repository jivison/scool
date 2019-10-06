class ApplicationController < ActionController::Base
    def import
        User.import(params[:file])
    end

    def current_user
        User.find_by(session[:user_id])
    end
    
    helper_method :current_user
    
    def admin_signed_in?
        current_user&.is_admin?
    end

    helper_method :admin_signed_in?

    def user_signed_in?
        !current_user.nil?
    end

    helper_method :user_signed_in?

end

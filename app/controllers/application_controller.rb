class ApplicationController < ActionController::Base
    def current_user
        User.find_by(session[:user_id])
    end
    
    def admin_signed_in?
        current_user&.is_admin?
    end

    helper_method :admin_signed_in?

    def user_signed_in?
        !current_user.is_nil?
    end

    helper_method :user_signed_in?

end

class SessionsController < ApplicationController

    def new
    end

    def create
        session[:user_id] = params[:user_id]
        redirect_to :root
    end

end

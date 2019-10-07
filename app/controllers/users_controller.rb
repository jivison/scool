class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end

  end

  def show
    @user = user.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def password
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to root_path
      flash[:notice] = 'User information updated'
    else
      render :edit
    end
  end

  def update_password
    if @user&.authenticate params[:user][ :current_password ]
      if @user.update user_params
          flash[:success] = "Password updated"
          redirect_to root_path
      else
          flash[:danger] = @user.errors.full_messages.join(', ')
          redirect_to password_path(@user)
      end
    else
      flash[:danger] = "You've entered an invalid current password"
      redirect_to password_path
    end
  end

  def destroy
    flash[:notice] = "User deleted"
    @user.destroy
    redirect_to root_path

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :status, :img_url, :is_admin)
  end




end

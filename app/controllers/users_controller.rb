class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new 
    @user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      session[:user_id] = @user.id
  		redirect_to root_path, notice: "Thanks for registering!"
  	else
  		render :new
  	end
  end

  def edit
  end

  def show
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update(user_params) 
      flash[:notice] = "Your profile was updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You're not allowed to do that."
      redirect_to root_path
    end
  end

  def user_params
  	params.require(:user).permit(:username, :password, :time_zone)
  end
end
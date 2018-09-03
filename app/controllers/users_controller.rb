class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.phone = params[:user][:phone]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash.now[:alert] = "Successfully created an account."
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:alert] = "Failed to create an account."
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @restaurant = @user.restaurants
  end
end

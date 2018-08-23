class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :load_restaurant, only: [:show, :edit, :update]
  before_action :require_ownership, only: [:edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reservation = Reservation.new
    # @owner = User.find(@restaurant.user_id)
    # <!-- <p>Owner: <%= @owner.first_name %></p> --> Put in show.html.erb
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:restaurant][:name]
    @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.opening_hour = params[:restaurant][:opening_hour]
    @restaurant.closing_hour = params[:restaurant][:closing_hour]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.menu = params[:restaurant][:menu]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.available_slots = params[:restaurant][:available_slots]
    @restaurant.user_id = current_user.id

    if @restaurant.save
      flash.now[:alert] = ["Successfully created a restaurant."]
      redirect_to root_url
    else
      flash.now[:alert] = ["Failed to create a restaurant."]
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.name = params[:restaurant][:name]
    @restaurant.neighbourhood = params[:restaurant][:neighbourhood]
    @restaurant.address = params[:restaurant][:address]
    @restaurant.opening_hour = params[:restaurant][:opening_hour]
    @restaurant.closing_hour = params[:restaurant][:closing_hour]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.menu = params[:restaurant][:menu]
    @restaurant.price_range = params[:restaurant][:price_range]
    @restaurant.available_slots = params[:restaurant][:available_slots]

    if @restaurant.save
      flash.now[:alert] = ["Successfully edited the restaurant."]
      redirect_to restaurant_url
    else
      flash.now[:alert] = ["Failed to edit the restaurant."]
      render :edit
    end
  end

  def destroy
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def require_ownership
    if current_user != @restaurant.user
      flash.now[:alert] = ["Access denied. You are not the owner of this restaurant."]
      redirect_to new_session_url
    end
  end
end

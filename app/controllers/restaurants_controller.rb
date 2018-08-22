class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new
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
    @restaurant.owner_id = current_user.id

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
  end

  def destroy
  end
end

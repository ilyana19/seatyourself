class RestaurantsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :load_restaurant, only: [:show, :edit, :update]
  before_action :require_ownership, only: [:edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(
      name: params[:restaurant][:name],
      neighbourhood: params[:restaurant][:neighbourhood],
      address: params[:restaurant][:address],
      opening_hour: params[:restaurant][:opening_hour],
      closing_hour: params[:restaurant][:closing_hour],
      summary: params[:restaurant][:summary],
      menu: params[:restaurant][:menu],
      price_range: params[:restaurant][:price_range],
      available_slots: params[:restaurant][:available_slots],
      max_capacity: params[:restaurant][:max_capacity],
      min_party_size: params[:restaurant][:min_party_size],
      max_party_size: params[:restaurant][:max_party_size],
      user: current_user
    )

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
    if @restaurant && @restaurant.update(
      name: params[:restaurant][:name],
      neighbourhood: params[:restaurant][:neighbourhood],
      address: params[:restaurant][:address],
      opening_hour: params[:restaurant][:opening_hour],
      closing_hour: params[:restaurant][:closing_hour],
      summary: params[:restaurant][:summary],
      menu: params[:restaurant][:menu],
      price_range: params[:restaurant][:price_range],
      available_slots: params[:restaurant][:available_slots],
      max_capacity: params[:restaurant][:max_capacity],
      min_party_size: params[:restaurant][:min_party_size],
      max_party_size: params[:restaurant][:max_party_size],
      user: current_user
    )
      flash.now[:alert] = ["Successfully edited the restaurant."]
      redirect_to restaurant_url
    else
      flash.now[:alert] = ["Failed to edit the restaurant."]
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_url
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

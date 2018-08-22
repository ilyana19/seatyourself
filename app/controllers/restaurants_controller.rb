class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

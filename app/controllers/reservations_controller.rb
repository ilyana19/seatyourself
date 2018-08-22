class ReservationsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
    @reservation.time_slot = params[:reservation][:time_slot]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.note = params[:reservation][:note]
    @reservation.restaurant_id = params[:restaurant_id]
    @reservation.user_id = current_user.id

    if @reservation.save
      flash.now[:alert] = ["Successfully made a reservation."]
      redirect_to root_url
    else
      flash.now[:alert] = ["Failed to made a reservation."]
      render 'restaurants/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

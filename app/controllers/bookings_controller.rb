class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]
  before_action :set_costume, only: %i[new create]
  def new
    authorize @costume
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    authorize @costume
    @booking.save
    console.log(@booking)
    redirect_to costume_path(@costume)
  end

  private

  def set_costume
    @costume = Costume.find(params[:costume_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

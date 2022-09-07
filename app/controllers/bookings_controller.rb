class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def create
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = current_user
    authorize @costume
    if @booking.save
      redirect_to costume_path(@costume), notice: "Booking saved"
    else
      render "costumes/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

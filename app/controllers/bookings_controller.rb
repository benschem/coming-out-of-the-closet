class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  include Pundit::Authorization

  def create
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new(booking_params)
    @booking.costume = @costume
    @booking.user = current_user
    @booking.status = 0
    authorize @costume
    if @booking.save
      redirect_to costumes_notice_path
    else
      render "costumes/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status].to_i
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end

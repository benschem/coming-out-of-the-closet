class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  include Pundit::Authorization

  def index
    @costumes = policy_scope(Costume)
  end

  def show
    @booking = Booking.new
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def new
    @costume = Costume.new
    authorize @costume
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to costume_path, status: see_other
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :price, :clothing, :photos)
  end
end

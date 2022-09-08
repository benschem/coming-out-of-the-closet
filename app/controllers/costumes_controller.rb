class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
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
    @costume = Costume.find(params[:id])
    authorize @costume
  end

  def update
    @costume.update(costume_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to costume_path(@costume)
  end

  def destroy
    @costume = Costume.find(params[:id])
    authorize @costume
    @costume.destroy
    redirect_to costume_path, status: :see_other
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :price, :clothing, :photo)
  end
end

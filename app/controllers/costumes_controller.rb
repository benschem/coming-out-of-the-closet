class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def index
    @costumes = Costume.all
  end

  def show
    @costume = Costume.find(params[:id])
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
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
    params.require(:costume).permit(:name, :description, :price, :type)
  end
end

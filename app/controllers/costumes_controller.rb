class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :notice]
  include Pundit::Authorization

  after_action :verify_authorized, except: [:index, :notice], unless: :skip_pundit?

  def index
    @costumes = policy_scope(Costume)
    if params[:query].present?
      @costumes = Costume.supersearch(params[:query])
    else
      @costumes = Costume.all
    end

    if params[:filter].present?
      if params[:filter] == "Show All"
        @costumes = Costume.all
      else
        @costumes = Costume.where("clothing ILIKE ?", "%#{params[:filter]}%")
      end
    end
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

  def notice
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

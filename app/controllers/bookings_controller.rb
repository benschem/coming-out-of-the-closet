class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :new]

  def new
  end

  def create
  end

  def update
  end
end

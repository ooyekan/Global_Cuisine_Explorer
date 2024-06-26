class CuisinesController < ApplicationController
  # GET /cuisines
  def index
    @cuisines = Cuisine.all
  end

  # GET /cuisines/1
  def show
    @cuisine = Cuisine.find(params[:id])
  end
end

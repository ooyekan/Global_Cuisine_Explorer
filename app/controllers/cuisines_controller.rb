class CuisinesController < ApplicationController
  def index
    if params[:country_id]
      @country = Country.find(params[:country_id])
      @cuisines = @country.cuisines.page(params[:page])
    else
      @cuisines = Cuisine.order(:name).distinct.page(params[:page])
    end
  end

  # GET /cuisines/1
  def show
    @cuisine = Cuisine.find(params[:id])
  end
end

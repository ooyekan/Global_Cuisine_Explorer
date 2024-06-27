class CountriesController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @countries = Country.where('name LIKE ? COLLATE NOCASE OR region LIKE ? COLLATE NOCASE', query, query)
    else
      @countries = Country.all
    end
  end

  def show
    @country = Country.find(params[:id])
    @cuisines = @country.cuisines
  end
end

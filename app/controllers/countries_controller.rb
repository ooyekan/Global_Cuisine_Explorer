class CountriesController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @countries = Country.where('name LIKE ? OR region LIKE ?', query, query).order(:name).uniq
    else
      @countries = Country.order(:name).distinct
    end
  end

  def show
    @country = Country.find(params[:id])
    @cuisines = @country.cuisines
    @languages = @country.languages
  end
end

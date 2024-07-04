class CountriesController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @countries = Country.where('name LIKE ? OR region LIKE ?', query, query).order(:name).distinct.page(params[:page])
    else
      @countries = Country.order(:name).distinct.page(params[:page])
    end
  end

  def show
    @country = Country.find(params[:id])
    @cuisines = @country.cuisines.limit(5).order(name: :asc)
    @languages = @country.languages
    @reviews = @country.reviews
  end
end

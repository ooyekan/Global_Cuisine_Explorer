class CountriesController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query]}%"
      @countries = Country.where('name LIKE ? OR region LIKE ?', query, query).order(:name).distinct.page(params[:page])
    elsif params[:region].present?
      @countries = Country.where(region: params[:region]).order(:name).distinct.page(params[:page])
    else
      @countries = Country.order(:name).distinct.page(params[:page])
    end
    @regions = Country.pluck(:region).uniq.compact
  end

  def show
    @country = Country.find(params[:id])
    @cuisines = @country.cuisines.limit(5).order(name: :asc)
    @languages = @country.languages
    @reviews = @country.reviews
  end
end

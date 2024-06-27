class LanguagesController < ApplicationController

    def index
      @languages = Language.order(name: :asc).page(params[:page])
    end

    def show
      @language = Language.find(params[:id])
      @countries = @language.countries.order(name: :asc)
    end

  end

class LanguagesController < ApplicationController

    def index
      @languages = Language.all.order(name: :asc)
    end

    def show
      @language = Language.find(params[:id])
      @countries = @language.countries.order(name: :asc)
    end

  end

class StaticPagesController < ApplicationController
  def about
    @reviews = Review.all
  end
end

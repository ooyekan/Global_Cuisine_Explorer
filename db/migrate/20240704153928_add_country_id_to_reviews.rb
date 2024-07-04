class AddCountryIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :country, foreign_key: true
  end
end

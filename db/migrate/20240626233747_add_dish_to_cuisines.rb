class AddDishToCuisines < ActiveRecord::Migration[7.1]
  def change
    add_column :cuisines, :dish, :string
  end
end

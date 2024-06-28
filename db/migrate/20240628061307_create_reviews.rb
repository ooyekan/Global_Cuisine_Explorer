class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end

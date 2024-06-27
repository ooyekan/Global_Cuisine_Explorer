class CreateCountryLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :country_languages do |t|
      t.references :country, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end

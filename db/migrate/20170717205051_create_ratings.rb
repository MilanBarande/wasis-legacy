class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string :type
      t.integer :rating
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end

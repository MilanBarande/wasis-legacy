class AddAmenitiesToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :wifi, :integer
    add_column :ratings, :noise, :integer
    add_column :ratings, :comfort, :integer
    add_column :ratings, :service, :integer
  end
end

class CreateWorkplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workplaces do |t|
      t.integer :category
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end

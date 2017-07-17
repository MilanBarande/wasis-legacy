class CreateWorkplaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workplaces do |t|
      t.integer :type
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitute

      t.timestamps
    end
  end
end

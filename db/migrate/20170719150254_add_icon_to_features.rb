class AddIconToFeatures < ActiveRecord::Migration[5.0]
  def change
      add_column :features, :icon, :string
  end
end

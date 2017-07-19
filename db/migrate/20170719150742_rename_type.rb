class RenameType < ActiveRecord::Migration[5.0]
  def change
    rename_column :ratings, :type, :description
  end
end

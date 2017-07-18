class AddGoogleIdToWorkplaces < ActiveRecord::Migration[5.0]
  def change
    add_column :workplaces, :google_id, :string
  end
end

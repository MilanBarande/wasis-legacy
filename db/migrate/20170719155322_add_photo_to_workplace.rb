class AddPhotoToWorkplace < ActiveRecord::Migration[5.0]
  def change
    add_column :workplaces, :photo, :string
  end
end

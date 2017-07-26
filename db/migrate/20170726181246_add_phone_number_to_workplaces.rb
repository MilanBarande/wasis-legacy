class AddPhoneNumberToWorkplaces < ActiveRecord::Migration[5.0]
  def change
    add_column :workplaces, :phone_number, :string
  end
end

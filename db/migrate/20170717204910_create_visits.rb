class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.boolean :checkin
      t.references :user, foreign_key: true
      t.references :workplace, foreign_key: true
      t.datetime :checkintime
      t.datetime :checkouttime

      t.timestamps
    end
  end
end

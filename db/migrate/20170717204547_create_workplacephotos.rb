class CreateWorkplacephotos < ActiveRecord::Migration[5.0]
  def change
    create_table :workplacephotos do |t|
      t.references :user, foreign_key: true
      t.references :workplace, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :workplace, foreign_key: true
      t.float :global_rating

      t.timestamps
    end
  end
end

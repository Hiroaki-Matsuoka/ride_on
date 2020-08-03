class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.references :user, foreign_key: true
      t.references :ride, foreign_key: true

      t.timestamps
      t.index [:user_id, :ride_id], unique: true
    end
  end
end

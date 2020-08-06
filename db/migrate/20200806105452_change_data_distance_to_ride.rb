class ChangeDataDistanceToRide < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :distance, :string
  end
end

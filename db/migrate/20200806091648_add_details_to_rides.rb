class AddDetailsToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :sch_datetime, :datetime
    add_column :rides, :distance, :integer
    add_column :rides, :rank, :integer
  end
end

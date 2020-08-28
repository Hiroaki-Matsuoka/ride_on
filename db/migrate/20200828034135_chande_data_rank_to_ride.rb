class ChandeDataRankToRide < ActiveRecord::Migration[5.2]
  def change
    change_column :rides, :rank, :string
  end
end

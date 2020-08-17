class AddPrefectureAndCityToRides < ActiveRecord::Migration[5.2]
  def change
    add_column :rides, :prefecture, :string
    add_column :rides, :city, :string
  end
end

class AddRideIdToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :ride, index: true
  end
end

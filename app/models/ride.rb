class Ride < ApplicationRecord
  belongs_to :user

  def user_name
    user.name
  end
end

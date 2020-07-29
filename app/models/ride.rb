class Ride < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def user_name
    user.name
  end
end

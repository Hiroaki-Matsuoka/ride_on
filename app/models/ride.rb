class Ride < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def user_name
    user.name
  end
end

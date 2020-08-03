class Ride < ApplicationRecord
  belongs_to :user
  has_many :joins
  has_many :j_users, through: :joins, source: :user, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def user_name
    user.name
  end

  def user_image_name
    user.image_name
  end
end

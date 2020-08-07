class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :ride
  # default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def user_name
    user.name
  end

  def user_image_name
    user.image_name
  end
end

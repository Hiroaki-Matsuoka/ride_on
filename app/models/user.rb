class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rides
  has_many :joins
  has_many :j_rides, through: :joins, source: :ride
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                foreign_key: "follower_id",
                                dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                foreign_key: "followed_id",
                                dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end

  def join(ride)
    joins.find_or_create_by(ride_id: ride.id)
  end

  def unjoin(ride)
    join = joins.find_by(ride_id: ride.id)
    join.destroy if join
  end

  def self.guest
    find_or_create_by!(name: 'ゲストユーザーさん', email: 'guest@example.com', image_name: 'default.jpeg') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end

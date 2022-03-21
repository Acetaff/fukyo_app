class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :fukyos
  has_many  :comments
  has_many  :favorites
  has_many  :relationships, class_name: "Relationship", foreign_key: "follower_id"
  has_many  :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many  :followings, through: :relationships, source: :followed
  has_many  :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  validates :fukyo_sya, presence: true
  validates :profile,   presence: true
end

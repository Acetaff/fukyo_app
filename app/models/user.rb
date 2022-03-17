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

  validates :fukyo_sya, presence: true
  validates :profile,   presence: true
end

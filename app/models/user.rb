class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many  :fukyos
  has_many  :comments

  validates :fukyo_sya, presence: true
  validates :profile,   presence: true
end

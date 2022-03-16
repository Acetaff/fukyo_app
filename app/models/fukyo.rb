class Fukyo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  validates :title,  presence: true
  validates :f_text, presence: true
  validates :image,  presence: true
end

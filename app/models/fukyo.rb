class Fukyo < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates  :title,  presence: true
  validates  :f_text, presence: true
end

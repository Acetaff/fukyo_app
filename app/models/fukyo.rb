class Fukyo < ApplicationRecord
  belongs_to :user

  validates  :title,  presence: true
  validates  :f_text, presence: true
end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :fukyo

  validates :c_text, presence: true
end

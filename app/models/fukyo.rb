class Fukyo < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title,  presence: true
  validates :f_text, presence: true
  validates :image,  presence: true

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Fukyo.where('title LIKE(?)', "%#{search}%")
    else
      Fukyo.all
    end
  end
end

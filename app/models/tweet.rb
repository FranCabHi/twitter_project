class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tw_content, presence: true

  def avatar
    user.user_photo
  end

  def counting_likes
    likes.count
  end
end
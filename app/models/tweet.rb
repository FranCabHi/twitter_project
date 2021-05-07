class Tweet < ApplicationRecord
  belongs_to :user
  validates :tw_content, presence: true

  def avatar
    user.user_photo
  end
end

class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tw_content, presence: true
  
  scope :tweets_for_me, -> (following_friends) { where user_id: following_friends }

  def tweet_ref
    Tweet.find(self.retweet_child)
  end

  def user_name
    user.user_name
  end

  def user_id
    user.id
  end
end
# 
# 
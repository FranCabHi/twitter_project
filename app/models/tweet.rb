class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tw_content, presence: true

  def tweet_ref
    Tweet.find(self.retweet_child)
  end
end
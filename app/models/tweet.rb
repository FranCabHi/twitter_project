class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tw_content, presence: true

  def tweet_ref
    Tweet.find(self.retweet_child)
  end

  def tweet_time_ago(tweet)
    if ((Time.now - tweet.created_at)/60.minutes) < 1
      puts "#{((Time.now - tweet.created_at)/1.minutes).round} hr ago"
    else
      puts "#{((Time.now - tweet.created_at)/60.minutes).round} min ago"
    end
  end
end
# 
# 
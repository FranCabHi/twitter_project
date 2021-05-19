class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :tw_content, presence: true
  has_many :tweet_hash_tags
  has_many :hash_tags, through: :tweet_hash_tags
  
  after_commit :create_hash_tags, on: :create
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

  def create_hash_tags
    extract_name_hash_tags.each do |name|
      hash_tags.create(name: name)
    end
  end
  
  def extract_name_hash_tags
    tw_content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end
# 
# 
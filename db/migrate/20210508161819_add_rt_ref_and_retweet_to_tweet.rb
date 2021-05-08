class AddRtRefAndRetweetToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :retweet_child, :integer
    add_column :tweets, :retweet, :integer, default: 0
  end
end

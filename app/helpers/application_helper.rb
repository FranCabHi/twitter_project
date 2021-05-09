module ApplicationHelper

  def like_check(tweet, user)
    tweet.likes.find {|like| like.user_id == user.id}
  end

  def tweet_time_ago(tweet)
    if ((Time.now - tweet.created_at)/60.minutes) < 1
      "#{((Time.now - tweet.created_at)/1.minutes).round} min ago"
    else
      "#{((Time.now - tweet.created_at)/60.minutes).round} hr ago"
    end
  end

end

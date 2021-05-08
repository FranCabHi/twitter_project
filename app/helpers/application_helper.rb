module ApplicationHelper

  def like_check(tweet, user)
    tweet.likes.find {|like| like.user_id == user.id}
  end

end

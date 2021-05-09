class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def avatar
    user.user_photo
  end

  def counting_likes
    likes.count
  end

end

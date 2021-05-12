class Friend < ApplicationRecord
    #sigue
    belongs_to :follower_user, foreign_key: :user_id, class_name: "User"

    #lo siguen
    belongs_to :followed_friend, foreign_key: :friend_id, class_name: "User"
end

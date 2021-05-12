class Friend < ApplicationRecord
    #sigue
    belongs_to :follower_user, foreign_key: :user_id, class_name: "User"

    #lo siguen
    belongs_to :followee_friend, foreign_key: :friend_id, class_name: "User"

    validates :user_id, uniqueness: {scope: :friend_id}
    validates :friend_id, uniqueness: {scope: :user_id}
end

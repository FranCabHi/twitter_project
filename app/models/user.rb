class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  #array of follows for the given user instance
  has_many :received_friendship, foreign_key: :friend_id, class_name: "Friend"

  #array of users who follow the user instance
  has_many :follower_friends, through: :received_friendship, source: :follower_user

  #array of follows a user gave to someone else
  has_many :given_friendship, foreign_key: :user_id, class_name: "Friend"

  #array of other users who the user has followed
  has_many :following_friends, through: :given_friendship, source: :followed_friend
end

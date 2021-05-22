class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  
  # the authenticate method from devise documentation
  def self.authenticate(email, password)
    user = User.find_for_authentication(email: email)
    user&.valid_password?(password) ? user : nil
  end

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  #array of follows for the given user instance
  has_many :received_friendship, foreign_key: :friend_id, class_name: "Friend"

  #array of users who follow the user instance
  has_many :follower_friends, through: :received_friendship, source: :follower_user

  #array of follows where the user is the follower
  has_many :given_friendship, foreign_key: :user_id, class_name: "Friend"

  #array (instance method for getting all of the users a user follows)
  has_many :following_friends, through: :given_friendship, source: :followee_friend
end

ActiveAdmin.register User do
  actions :all, only: [:update, :destroy, :show]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :email, :user_name, tweet_ids: [], like_ids: []  #:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_name, :user_photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :user_name
    column :email
    column :tweets do |user|
      user.tweets.count
    end
    column :likes do |user|
      user.likes.count
    end
    column :retweets do |user|
      user.tweets.where.not(retweet_child: id).count
    end
    column "Followers" do |user|
      user.follower_friends.count
    end
    column "Following" do |user|
      user.following_friends.count
    end
    actions
  end

  
end

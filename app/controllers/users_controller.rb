class UsersController < ApplicationController

    def friend
        @user = User.find(params[:id])
        current_user.following_friends << @user
        redirect_back(fallback_location: root_path) #user_path(@user)
    end

    def unfriend
        @user = User.find(params[:id])
        current_user.given_friendship.find_by(friend_id: @user.id).destroy
        redirect_back(fallback_location: root_path)
    end

end
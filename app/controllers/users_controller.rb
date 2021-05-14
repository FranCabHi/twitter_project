class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @tweets = Tweet.where(user_id: params[:id]).order("created_at DESC").page(params[:page])
    end

    def friend
        @user = User.find(params[:id])
        current_user.following_friends << @user
        redirect_back(fallback_location: user_path(@user))
    end

    def unfriend
        @user = User.find(params[:id])
        current_user.given_friendship.find_by(friend_id: @user.id).destroy
        redirect_back(fallback_location: user_path(@user))
    end

end
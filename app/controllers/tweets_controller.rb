class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy retweet]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC").page(params[:page])
    @tweet = Tweet.new
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params.merge(user: current_user))
    #@tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :index, status: :created, location: @tweet }
      else
        format.html { redirect_to root_path, notice: "Cannot post an empty tweet." }
        #format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  # def update
  #   if @tweet.user == current_user
  #     respond_to do |format|
  #       if @tweet.update(tweet_params)
  #         format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
  #         format.json { render :show, status: :ok, location: @tweet }
  #       else
  #         format.html { render :edit, status: :unprocessable_entity }
  #         format.json { render json: @tweet.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   else
  #     redirect_to tweets_url, alert: 'You lack permissions to edit'
  #   end
  # end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def retweet
    redirect_to root_path, alert: "Unable to retweet your own tweet." and return if @tweet.user == current_user
    retweeted = Tweet.new(tw_content: @tweet.tw_content, retweet_child: @tweet.id)
    retweeted.user = current_user
    if retweeted.save
      @tweet.update(retweet: @tweet.retweet +=1) 
      redirect_to root_path, notice: "Retweet was posted successfully."
    else
      redirect_to root_path, alert: "Unable to retweet."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:tw_content, :user_name, :user_photo)
    end
end

module Api
    class TweetsController < Api::ApplicationController
        def create     
          @tweet = Tweet.new(user_id: current_user.id, tw_content: params[:tw_content])
          if @tweet.save
              render :json => @tweet
          else
              render json: { errors: @tweet.errors.full_messages }, status: :unprocessable_entity
          end
        end
   
        def news
          @tweets = Tweet.all
          @json_array = []
          @tweets.each do |tweet|
            tweet_hash = {
              :id => tweet.id,
              :content => tweet.tw_content,
              :user_id => tweet.user_id,
              :like_count => tweet.counting_likes,
              :retweet_count => tweet.retweet,
              :retweeted_from =>  if !tweet.retweet_child.nil?
                                      tweet.tweet_ref.id
                                  else 
                                      tweet.retweet_child.to_i
                                  end
            }
            @json_array.push tweet_hash
          end
      
          render :json => @json_array.last(50)
        end
    
        def dates_interval
          @tweets = Tweet.where("created_at >= :start_date AND created_at <= :end_date", {:start_date => params[:date1].to_date.beginning_of_day, :end_date => params[:date2].to_date.end_of_day} )
        

          @json_array = []
          @tweets.each do |tweet|
            tweet_hash = {
              :id => tweet.id,
              :content => tweet.tw_content,
              :user_id => tweet.user_id,
              :like_count => tweet.counting_likes,
              :retweet_count => tweet.retweet,
              :retweeted_from =>  if !tweet.retweet_child.nil?
                                      tweet.tweet_ref.id
                                  else 
                                      tweet.retweet_child.to_i
                                  end
            }
            @json_array.push tweet_hash
          end
        
          render :json => @json_array
        end
    
        private

        def tweet_params
          params.require(:tweet).permit(:tw_content, :user_id)
        end
     end
end
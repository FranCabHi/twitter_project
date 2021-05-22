Rails.application.routes.draw do
  get 'search/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tweets, only: [:index, :show, :create, :destroy] do
    resources :likes
    member do
      post "retweet"
    end
  end

  #resources :users, only: [:show]
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get '/users/:id', to: 'users#show', as: "user"
  end
  
  post '/user/:id/friend', to: "users#friend", as: "friended_user"
  post '/user/:id/unfriend', to: "users#unfriend", as: "unfriended_user"

  get 'search', to: 'search#index'

  get '/api/news', to: "tweets#news"
  get '/api/:date1/:date2', to: "tweets#dates_interval"
  
  root "tweets#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

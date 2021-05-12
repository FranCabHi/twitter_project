Rails.application.routes.draw do
  resources :tweets, only: [:index, :show, :create, :destroy] do
    resources :likes
    member do
      post "retweet"
    end
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  post '/user/:id/friend', to: "users#friend", as: "friended_user"
  post '/user/:id/unfriend', to: "users#unfriend", as: "unfriended_user"

  root "tweets#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

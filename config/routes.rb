Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'accounts#index'
  get 'profile/:username', to: 'accounts#profile', as: :profile
  root to: "public#home"
  #likes in production make it post method not get method cuz it might leat too caohs
  get 'post/like/:post_id', to: 'likes#save_like', as: :likepost

    post "follow/account", to: "accounts#follow_account",as: :follow_account
  resources :posts, only: [:new,:create,:show]
  resources :comments, only: [:create]


end

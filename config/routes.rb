Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'accounts#index'
  get 'profile/:username', to: 'accounts#profile', as: :profile
  root to: "public#home"

  resources :posts, only: [:new,:create,:show]

end

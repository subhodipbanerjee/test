Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/profile', to: 'home#profile', as: 'profile'

  devise_for :users
  # devise_for :users, controllers: { sessions: 'users/sessions' }

end

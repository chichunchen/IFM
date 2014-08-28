Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :books

  root 'home#index'

  get 'tags/:tag', to: 'books#index', as: :tag
end

Rails.application.routes.draw do
  get 'sessions/new'
  get 'blogs/like'
  root to: 'users#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions
  resources :favorites, only: [:create, :destroy]
  resources :blogs do
    collection do
      post:confirm
    end
  end
end
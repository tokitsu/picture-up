Rails.application.routes.draw do
  get 'sessions/new'
  get 'blogs/like'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
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
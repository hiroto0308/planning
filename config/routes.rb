Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :events do
    # post 'events/:id', to: 'comments#create'
    resources :comments, only: [:create]
  end  
  resources :comments, only: [:destroy]
  # get 'comments/create_comment', to: 'comments#create_comment'
  # post 'events/:id', to: 'comments#create'
end

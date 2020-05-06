Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'
  get 'search' => 'serachs#search'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end

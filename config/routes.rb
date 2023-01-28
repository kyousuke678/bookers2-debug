Rails.application.routes.draw do
  devise_for :users
  
  get "home/about"=>"homes#about",as: "about"
  root to: "homes#top"
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  get "search" => "searches#search"
  
  resources :chats, only: [:show, :create]
end
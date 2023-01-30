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
  	get "search", to: "users#search"
  end
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
    resources :event_notices, only: [:new, :create]
    get "event_notices" => "event_notices#"
  end
  get "search" => "searches#search"
  
  resources :chats, only: [:show, :create]
end
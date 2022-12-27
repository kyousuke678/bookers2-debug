Rails.application.routes.draw do
  devise_for :users
  get "home/about"=>"homes#about",as: "about"
  root to: "homes#top"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
end
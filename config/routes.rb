Rails.application.routes.draw do
  
  devise_for :users
  resources :users,only: [:index,:show,:edit,:update] 
  resources :books, only: [:index,:edit,:show,:create,:destroy,:update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"
end

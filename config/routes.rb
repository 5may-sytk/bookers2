Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'about', to: 'homes#about', as:'about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:show, :index, :edit, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

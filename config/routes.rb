Rails.application.routes.draw do
  get 'joins/create'
  get 'home/index'
  get 'users/search'
  post 'users/result'
  get 'other/:id', to: 'users#other', as: 'other'
  get 'footprints', to: 'users#footprints', as: 'footprints'
  get 'communities/search'
  post 'communities/result'
  get 'communities/join/:id', to: 'communities#join'
  resources :communities
  devise_for :users
  resources :users, expect: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end

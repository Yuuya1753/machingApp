Rails.application.routes.draw do
  get 'home/index'
  get 'search', to: 'users#search'
  get 'result', to: 'users#result'
  get 'other/:id', to: 'users#other', as: 'other'
  get 'footprints', to: 'users#footprints', as: 'footprints'
  devise_for :users
  resources :users, expect: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end

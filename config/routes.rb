Rails.application.routes.draw do
  get '/uploads/user/image/:id/:file', :controller => 'users', :action => 'download'
  get '/uploads/community/image/:id/:file', :controller => 'communities', :action => 'download'
  get 'matches/show/:id', to: 'matches#show', as: 'matches/show'
  post 'messages/count_message'
  post 'messages/new_display'
  get 'likes/create'
  get 'joins/create'
  get 'home/index'
  get 'users/search'
  post 'users/search'
  get 'other/:id', to: 'users#other', as: 'other'
  get 'footprints', to: 'users#footprints', as: 'footprints'
  get 'communities/search'
  post 'communities/search'
  get 'communities/join/:id', to: 'communities#join'
  get 'likes/:id', to: 'users#like'
  get 'users/show_likes/:id', to: 'users#show_likes', as: 'show_likes'
  get 'users/show_matches/:id', to: 'users#show_matches', as: 'show_matches'
  resources :communities
  resources :messages
  devise_for :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users, expect: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end

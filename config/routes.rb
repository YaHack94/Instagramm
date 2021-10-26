Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get '/' => 'users#index'
  get '/', to: 'users#index', as: 'user'
  get '/new_user', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  post '/sessions' => 'sessions#create'
  #post '/users' => 'users#create'
  get '/dashboard' => 'accounts#index'
  post '/dashboard/publication', to: 'accounts#create', as: 'createpub'
  get '/logout', to: 'sessions#destroy', as: 'destroy'
  get 'user/:id/edit', to: 'users#update', as: 'editform'
  post 'user/:id/edit', to: 'users#update', as: 'modifier'

  resources :posts, only: [:new,:create,:show]
end

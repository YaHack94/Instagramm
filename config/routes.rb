Rails.application.routes.draw do
  get '/', to: 'users#index', as: 'user'
  get '/new_user', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  post '/sessions' => 'sessions#create'
  get '/dashboard' => 'accounts#index'
  post '/dashboard/publication', to: 'accounts#create', as: 'createpub'
  get '/logout', to: 'sessions#destroy', as: 'destroy'
  get 'user/:id/edit', to: 'users#update', as: 'editform'
  post 'user/:id/edit', to: 'users#update', as: 'modifier'
  get  '*path', controller: 'application', action: 'render_404'
  post '*path', controller: 'application', action: 'render_404'
  get  '*path', controller: 'application', action: 'render_500'
  post '*path', controller: 'application', action: 'render_500'
  resources :posts, only: [:new,:create,:show]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # LONG WAY
  # get '/posts', to: 'posts#index'
  # get '/posts/:id', to: 'posts#show' # just because we name the wildcard ':id' doesn't mean only id's can be passed in
  # post '/posts', to: 'posts#create'
  # patch '/posts/:id', to: 'posts#update'
  # delete '/posts/:id', to: 'posts#destroy'
  # get '/banana', to: 'potato#fruit'

  # SHORT WAY (resources)
  # resources :posts # will create all 7 routes
  # resources :posts, only: [:index, :show, :create, :update, :destroy] # 'only' selects the routes to create
  # resources :posts, except: [:edit] # 'except' excludes the specified routes when creating the normal 7
  # resources :users
  # resource :session, only: [:new, :create, :destroy]
  root to: "static_pages#root"
  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index, :create, :show, :update, :destroy]
  end

end
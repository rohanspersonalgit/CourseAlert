Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  namespace :api do
    namespace :v1 do
      get 'users/index'
      get 'users/logout', to: 'sessions#destroy'
      get 'users/login', to: 'sessions#create'
      post 'users/create'
      get '/show:id', to: 'users#show'
      delete '/destroy:id', to: 'users#destroy'
    end
  end
  root 'homepage#index'
  resources :sessions, only: [:new, :create, :destroy]
  get '/*path' => 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

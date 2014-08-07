Rails.application.routes.draw do
  root 'blags#index'

    resources :users, only: [:show]
    get '/g', to: 'blags#index'
    get '/g/:slug', to: 'blags#show'
    get '/search', to: 'blags#search', as: 'search'
    get '/t/:tag', to: 'blags#bytag'

    scope '/admin' do 
      resources :users, only: [:index, :edit, :update, :new, :create] 
      resources :blags, only: [:edit, :update, :new, :create, :destroy]
      get '/', to: 'users#login'
      get '/login', to: 'users#login', as: 'login'
      post '/login', to: 'users#auth'
    end
end

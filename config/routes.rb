Rails.application.routes.draw do
  root 'blags#index'

    resources :users, only: [:show]
    resources :blags, only: [:index, :show]

    scope '/admin' do 
      resources :users, only: [:index, :edit, :update, :new, :create, :login] 
      resources :blags, only: [:edit, :update, :new, :create, :destroy]
    end
end

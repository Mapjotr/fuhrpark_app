Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/impressum', to: 'static_pages#impressum'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :cars do
    resources :refuellings do
      get :update_date2, on: :collection
    end
    resources :repairs
    get :calc_consump, on: :collection
    resources :rentals
  end
end

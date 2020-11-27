Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/error'

  # These two require session to be validated
  get 'pages/account'
  get 'pages/admin_panel'

  post 'login', to: 'sessions#create_user'
  get 'login', to: 'sessions#new_user'
  match 'signup', to: 'users#new', via: :get

  post 'admin/login', to: 'sessions#create_admin'
  get 'admin/login', to: 'sessions#new_admin'
  match 'admin/signup', to: 'admins#new', via: :get

  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :delete
    end
  end

  resources :admins do
    member do
      get :delete
    end
  end
end

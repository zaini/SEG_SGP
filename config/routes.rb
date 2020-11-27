Rails.application.routes.draw do
  root 'pages#homepage'
  get 'pages/error'

  # These two require session to be validated
  get 'pages/account'
  get 'pages/admin_panel'

  post 'pages/user_login'
  match 'login', to: 'pages#homepage', via: :get
  match 'signup', to: 'users#new', via: :get

  post 'pages/admin_login'
  match 'admin/login', to: 'pages#adminlogin', via: :get
  match 'admin/signup', to: 'admins#new', via: :get

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
  
  # get 'admins/index'
  # get 'admins/show'
  # get 'admins/new'
  # get 'admins/edit'
  # get 'admins/delete'

  # get 'users/index'
  # get 'users/show'
  # get 'users/new'
  # get 'users/edit'
  # get 'users/delete'
end

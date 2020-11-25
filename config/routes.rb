Rails.application.routes.draw do
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

  # get 'manage_users/create_user'
  match 'admin/manage_users/create', :to => 'manage_users#create_user', :via => :get
  # get 'manage_users/edit_user'
  match 'admin/manage_users/edit', :to => 'manage_users#edit_user', :via => :get
  # get 'manage_users/delete_user'
  match 'admin/manage_users/delete', :to => 'manage_users#delete_user', :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

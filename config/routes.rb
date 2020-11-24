Rails.application.routes.draw do
  # get 'manage_users/create_user'
  match 'admin/create', :to => 'manage_users#create_user', :via => :get
  # get 'manage_users/edit_user'
  match 'admin/edit', :to => 'manage_users#edit_user', :via => :get
  # get 'manage_users/delete_user'
  match 'admin/delete', :to => 'manage_users#delete_user', :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

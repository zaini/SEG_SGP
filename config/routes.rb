Rails.application.routes.draw do
  root 'pages#homepage'
  post 'pages/create'
  get 'pages/error'
  # get 'create_profile/create_profile'
  match 'admin/create_profile', :to => 'create_profile#create_profile', :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'homepage#homepage'
  post 'homepage/create'
  # get 'create_profile/create_profile'
  match 'admin/create_profile', :to => 'create_profile#create_profile', :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

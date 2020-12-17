Rails.application.routes.draw do
  root 'extras#landing'

  get 'pages/error'

  get 'randoms/random'

  get 'offer', to: 'extras#offer'

  get 'loan', to: 'extras#loan'
  get 'loans', to: 'extras#loan'
  get 'contact_us', to: 'extras#contact_us'
  get 'savings', to: 'extras#savings'

  get 'account', to: 'pages#account'
  get 'account/:id', to: 'bank_accounts#show'
  get 'admin_panel', to: 'pages#admin_panel'

  post 'login', to: 'sessions#create_user'
  get 'login', to: 'sessions#new_user'
  match 'signup', to: 'pages#fakesignup', via: :get
  match 'signup_user', to: 'users#new', via: :get

  post 'admin/login', to: 'sessions#create_admin'
  get 'admin/login', to: 'sessions#new_admin'
  match 'admin/signup', to: 'admins#new', via: :get
  post 'admins', to: 'admins#create'

  delete 'logout', to: 'sessions#destroy'

  get 'admin_panel/users', to: 'users#index'

  resources :users do
    member do
      get :delete
    end
  end

  resources :bank_accounts do
    member do
      get :delete
      get :statement
      get :transfer
      get :payment
      post :transfer_money
      post :send_payment
    end
  end

  resources :bank_accounts do
    resources :transactions
  end

  # resources :currencies do
  #   member do
  #     get :delete
  #   end
  # end

  get 'admin', to: 'pages#admin'
  match "*path", to: 'pages#error404', via: :all

end

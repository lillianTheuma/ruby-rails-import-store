Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/session#destroy'
  end
  root to:'application#index'

  resources :products do
    resources :reviews
  end

  resources :vendors
  resources :users do
    get '/add_role/:role_id' => 'users#add_role'
    get '/remove_role/:role_id' => 'users#remove_role'
  end
  resources :roles
end

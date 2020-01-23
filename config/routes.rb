Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/session#destroy'
  end
  root to:'application#index'

  resources :products do
    resources :reviews
  end
end

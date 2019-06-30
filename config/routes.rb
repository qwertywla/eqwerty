Rails.application.routes.draw do
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :products do
    resources :comments
  end

  resources :users
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/landing_page'
  get 'simple_pages/bio'
  get 'simple_pages/portfolio'
  get 'simple_pages/contact'
  get 'simple_pages/index'

  root 'simple_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'simple_pages/thank_you'
end

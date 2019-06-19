Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :users
  resources :products
  get 'simple_pages/landing_page'
  get 'simple_pages/bio'
  get 'simple_pages/portfolio'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'products/show'
  post 'simple_pages/thank_you'

  root 'simple_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :orders, only: [:index, :show, :create, :destroy]

end

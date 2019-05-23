Rails.application.routes.draw do
  resources :products
  get 'simple_pages/bio'
  get 'simple_pages/contact'
  get 'simple_pages/portfolio'
  get 'simple_pages/index'
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  get 'products/show'

  root 'simple_pages#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :orders, only: [:index, :show, :create, :destroy]

end

Rails.application.routes.draw do
  devise_for :users
  resources :price_registers
  resources :sales
  resources :products
  resources :categories
  resources :rotations
  resources :employees
  resources :stalls
  resources :departments
  resources :phone_numbers
  resources :branch_offices
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'branch_offices#index'
end

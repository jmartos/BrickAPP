Rails.application.routes.draw do
  devise_for :users 
  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
  get '/support', to: 'site#support'
  get '/profile', to: 'users#show'

  resources :works
  resources :suppliers 

  # namespace :work_id do
  #   resources :fixes
  # end

  # namespace :supplier_id do
  #   resources :fixes
  # end

  get 'works/:work_id/fixes/', to: 'fixes#index'
  get 'suppliers/:supplier_id/fixes/', to: 'fixes#index'
end

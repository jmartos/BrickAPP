Rails.application.routes.draw do
  devise_for :users 
  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
  get '/support', to: 'site#support'
  get '/profile', to: 'users#show'

  resources :works
  resources :suppliers 
end

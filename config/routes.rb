Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
end

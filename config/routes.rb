Rails.application.routes.draw do
  devise_for :users 
  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
  get '/support', to: 'site#support'
  get '/profile', to: 'users#show'

  resources :works
  resources :suppliers 

  get 'works/:work_id/fixes', to: 'fixes#index', as: 'fix_index'
  get 'works/:work_id/fixes/new', to: 'fixes#new', as: 'fix_new'
  post 'works/:work_id/fixes/new', to: 'fixes#create'
  post 'works/:work_id/fixes/:id/check', to: 'fixes#check', as: 'fixes_check'
end

# pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
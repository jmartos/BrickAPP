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
  get 'works/:work_id/fixes/:id/edit', to: 'fixes#edit', as: 'fix_edit'
  put 'works/:work_id/fixes/edit', to: 'fixes#update'
  delete 'works/:work_id/fixes/:id/edit', to: 'fixes#destroy'
  post 'works/:work_id/fixes/:id/check', to: 'fixes#check', as: 'fixes_check'

  get 'suppliers/valorations', to: 'suppliers#valorations', as: 'suppliers_valorations'

end

# pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
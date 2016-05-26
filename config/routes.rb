Rails.application.routes.draw do
  devise_for :users 
  
  get '/', to: 'site#home', as: 'home'
  get '/contact', to: 'site#contact', as: 'contact'
  get '/profile', to: 'users#show', as: 'profile'

  resources :works
  resources :suppliers 

  get 'works/:work_id/fixes', to: 'fixes#index', as: 'fix_index'
  get 'works/:work_id/fixes/new', to: 'fixes#new', as: 'fix_new'
  post 'works/:work_id/fixes/', to: 'fixes#create', as: 'fix_create'
  get 'works/:work_id/fixes/:id/edit', to: 'fixes#edit', as: 'fix_edit'
  patch 'works/:work_id/fixes/:id', to: 'fixes#update', as: 'fix_update'
  delete 'works/:work_id/fixes/:id/delete', to: 'fixes#destroy', as: 'fix_destroy'
  post 'works/:work_id/fixes/:id/check', to: 'fixes#check', as: 'fixes_check'
  get 'works/:work_id/fixes/email', to: 'fixes#send_email', as: 'fix_email'

  get 'works/:work_id/review', to: 'supplier_reviews#new', as: 'new_supplier_review'
  post 'works/:work_id/review', to: 'supplier_reviews#create'

end

# pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
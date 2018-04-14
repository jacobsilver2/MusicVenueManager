Rails.application.routes.draw do
  root 'shows#index'
  get '/shows/:id/destroy', to: 'shows#destroy'
  get '/acts/:id/destroy', to: 'shows#destroy'
  
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :shows, :only => [:index, :show, :edit, :update, :destroy, :create]
  resources :acts, :only => [:index, :show, :edit, :update, :destroy, :create]
  
  resources :users do
    resources :shows, :only => [:new]
    resources :acts, :only => [:new]
  end
  
end
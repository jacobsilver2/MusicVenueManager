Rails.application.routes.draw do
  root 'shows#index'
  get '/shows/:id/destroy', to: 'shows#destroy'
  get '/acts/:id/destroy', to: 'shows#destroy'
  
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :shows, :only => [:index, :show, :edit, :update, :destroy, :create]
  resources :acts, :only => [:index, :show, :edit, :update, :destroy, :create]
  
  resources :users do
    resources :shows, :only => [:new]
  end
  
  resources :shows do
    resources :acts, :only => [:new]
  end
  
end


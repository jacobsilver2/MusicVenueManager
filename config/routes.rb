Rails.application.routes.draw do
  # root 'shows#index'
  get '/shows/:id/destroy', to: 'shows#destroy'
  get '/acts/:id/destroy', to: 'shows#destroy'
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticated :user do
		root 'shows#index', as: 'authenticated_root'
	end
	devise_scope :user do
		root 'devise/sessions#new'
	end
  resources :shows, :only => [:index, :show, :edit, :update, :destroy, :create]
  resources :acts, :only => [:show, :edit, :update, :destroy, :create]
  
  resources :users do
    resources :shows, :only => [:new]
  end
  
  resources :shows do
    resources :acts, :only => [:new, :index]
  end
  
end


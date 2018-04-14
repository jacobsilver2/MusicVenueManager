Rails.application.routes.draw do
  root 'shows#index'


  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do
    resources :shows
    resources :acts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end






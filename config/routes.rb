Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'registrations' }
  resources :products
  resources :events
  resource :cart, only: [:show]

  resources :users, only: [:index]


  resources :orders do
  resources :order_items
  end
  resources :order_items
  resources :addresses do
    resources :charges
  end


  root :to => 'welcome#index'

end

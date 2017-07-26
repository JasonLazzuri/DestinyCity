Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :events
  resource :cart, only: [:show]


  resources :orders do
  resources :order_items
  end
  resources :order_items


  root :to => 'welcome#index'

end

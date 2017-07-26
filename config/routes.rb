Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :events
  root :to => 'welcome#index'

end

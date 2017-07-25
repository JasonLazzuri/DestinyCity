Rails.application.routes.draw do
  resources :products
  resources :events
  root :to => 'welcome#index'

end

Rails.application.routes.draw do

  get 'cuisines', to: 'restaurants#cuisines'
  resources :reviews
  resources :restaurants
  get 'test/hello'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

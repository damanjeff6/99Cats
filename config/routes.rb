Ninetyninecats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests
  resources :users, :only => [:new, :create]
  resource :session
end

Rails.application.routes.draw do

  #if we didnt use resources:users
  get "/filip", to:"users#show", id:1

  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

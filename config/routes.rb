Rails.application.routes.draw do
  root 'static_pages#home'
  resources :rentals, except: [:show, :edit, :update]

  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

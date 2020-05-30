Rails.application.routes.draw do
 
  devise_for :users
  
  resources :eventos
  post 'evento/:id', to: 'eventos#delete_image', as: 'delete_image'
  get 'home/index'
  root to: 'home#index'
  get 'home/change_region'
  get 'home/politicas'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

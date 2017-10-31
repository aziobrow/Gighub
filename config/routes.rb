Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:index]

  resources :carts, only: [:create]

  get '/:category_name', to: 'categories#show', as: 'category_items'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items, only: [:index]

  resource :cart, only: [:create, :show, :destroy]

  get '/:category_name', to: 'categories#show', as: 'category_items'

end

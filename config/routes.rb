Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "single_pages#index"

  resources :items, only: [:index, :show]

  resource :cart, only: [:create, :show, :destroy]

  get '/:category_name', to: 'categories#show', as: 'category_items'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
  end

  resources :items, only: [:index]

  resource :cart, only: [:create, :show]

  get '/:category_name', to: 'categories#show', as: 'category_items'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'items#index'

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    post '/logout' => :destroy
  end

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  resources :users, only: [:new, :create]

  resources :items, only: [:index]

  resource :cart, only: [:create, :show]

  get '/:slug', to: 'categories#show', as: 'category_items'

end

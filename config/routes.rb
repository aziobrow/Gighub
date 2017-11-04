Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "single_pages#index"

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  resources :items, only: [:index, :show]

  resource :cart, only: [:create, :show, :destroy, :update]

  namespace :admin do
    resources :orders, only: [:show]
    get '/dashboard', to: 'users#show'
  end

  get '/:slug', to: 'categories#show', as: 'category_items'

end

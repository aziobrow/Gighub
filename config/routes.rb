Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "single_pages#index"

  root 'items#index'

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end

  resources :users, only: [:new, :create]
  get '/dashboard', to: 'users#show'

  resources :users, only: [:new, :create]

  resources :items, only: [:index, :show]

  resource :cart, only: [:create, :show, :destroy, :update]

  namespace :admin do
    resources :orders, only: [:show]
  end

  get '/:slug', to: 'categories#show', as: 'category_items'

end

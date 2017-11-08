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
  resources :orders, only: [:index, :show, :create, :update]

  namespace :admin do
    resources :orders, only: [:show]
    resources :items, only: [:new, :create, :edit, :update, :index]
    get '/dashboard', to: 'users#show'
    get '/edit', to: 'users#edit'
    resources :users, only: [:update]
  end

  get '/:slug', to: 'categories#show', as: 'category_items'

end

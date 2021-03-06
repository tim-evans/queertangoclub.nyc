Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  root to: 'home#index'
  get '/about' => 'about#index'
  get '/privacy' => 'about#privacy'

  resources :events, only: [:index, :show, :new, :create, :update, :edit] do
    member do
      get 'choose'
      post 'add_to_cart'
      get 'checkout'
      post 'purchase'
      get 'receipt'
      get 'publish'
      get 'unpublish'
      get 'privates/:id', to: redirect('/privates/%{id}')
    end

    scope module: 'event' do
      resources :photos, only: [:index]
      resources :ledger, only: [:index, :new, :create, :edit, :update]
      resources :members, only: [:index]
      resources :attendees, only: [:index, :new, :create, :delete]
      resources :discounts, only: [:index]
      resources :sessions, only: [:index]
    end
  end

  resources :users, only: [:index, :show, :new, :create] do
    member do
      get 'logout'
    end
  end

  resources :privates, only: [:show]
  resources :cover_photos, only: [:create, :update, :destroy]

  resources :photos, only: [:create, :destroy]
  resources :attendees, only: [:update]
  resources :sessions, only: [:create, :update, :destroy]

  get '/workshops', to: redirect('/events')
  get '/milongas', to: redirect('/events')
  resources :locations, only: [:show]


  match '/404', via: :all, to: 'application#not_found'
  match '/500', via: :all, to: 'application#internal_server_error'
  match '*any', via: :all, to: 'application#not_found'
end

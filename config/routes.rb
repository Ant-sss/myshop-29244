Rails.application.routes.draw do
  get 'cards/new'
  get 'customers/show'

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }
  devise_scope :customer do
    get 'residences', to: 'customers/registrations#new_residence'
    post 'residences', to: 'customers/registrations#create_residence'
  end

  devise_for :shopkeepers, controllers: {
    registrations: 'shopkeepers/registrations',
    sessions: 'shopkeepers/sessions',
    passwords: 'shopkeepers/passwords'
  }
  devise_scope :shopkeeper do
    get 'addresses', to: 'shopkeepers/registrations#new_address'
    post 'addresses', to: 'shopkeepers/registrations#create_address'
  end

  resources :shops, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :items, only: [:show, :new, :create, :edit, :update ,:destroy] do
      collection do
        get 'search'
      end
      resources :itemcomments, only: :create
      resources :purchases, only: [:index, :create] do
        collection do
          get 'done'
        end
      end
    end
    resources :tweets, only: [:index, :show, :new, :create, :destroy] do
      resources :tweetcomments, only: :create
    end
    resources :favorites, only: [:create, :destroy]
  end
  resources :customers, only: :show
  resources :residences, only: [:show, :update]
  resources :shopkeepers, only: :show
  resources :address, only: [:show, :update]
  resources :cards, only: [:new, :create]
  resources :favorites, only: :index

  root to: "shops#index"

end

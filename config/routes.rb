Rails.application.routes.draw do
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
    resources :items, only: [:show, :new, :create, :edit, :update ,:destroy] do
      resources :itemcomments, only: :create
    end
    resources :tweets, only: [:index, :show, :new, :create, :destroy] do
      resources :tweetcomments, only: :create
    end
  end
  resources :customers, only: [:show]
  resources :resodences, only: [:show, :update]
  resources :shopkeepers, only: [:show, :update]
  resources :address, only: [:show, :update]

  root to: "shops#index"

end

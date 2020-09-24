Rails.application.routes.draw do
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

  resources :home, only: [:index]
  resources :shop, only: [:index]
  root to: "home#index"

end

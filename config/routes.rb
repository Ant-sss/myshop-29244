Rails.application.routes.draw do
  devise_for :shopkeepers, controllers: {
    registrations: 'shopkeepers/registrations'
  }
  devise_scope :shopkeeper do
    get 'addresses', to: 'shopkeepers/registrations#new_address'
    post 'addresses', to: 'shopkeepers/registrations#create_address'
  end
  resources :home, only: [:index]
  resources :shop, only: [:index]
  root to: "home#index"
end

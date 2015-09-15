Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      resources :merchants, only: [:show]
      resources :customers, only: [:show]
      resources :invoices, only: [:show]
      resources :items, only: [:show]
      resources :invoice_items, only: [:show]
      resources :transactions, only: [:show]
    end
  end
end

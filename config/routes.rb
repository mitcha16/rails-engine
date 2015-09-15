Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'merchants/find', to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find'
      resources :merchants, only: [:show]
      get 'customers/find', to: 'customers#find'
      resources :customers, only: [:show]
      get 'invoices/find', to: 'invoices#find'
      resources :invoices, only: [:show]
      get 'items/find', to: 'items#find'
      resources :items, only: [:show]
      get 'invoice_items/find', to: 'invoice_items#find'
      resources :invoice_items, only: [:show]
      get 'transactions/find', to: 'transactions#find'
      resources :transactions, only: [:show]
    end
  end
end

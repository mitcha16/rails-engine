Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants
      resources :customers
      resources :invoices
      resources :items
      resources :invoice_items
      resources :transactions
    end
  end
end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants
      resources :customers
      resources :invoices
    end
  end
end

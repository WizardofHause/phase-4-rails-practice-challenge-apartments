Rails.application.routes.draw do
  resources :leases, only: [:create, :update, :destroy]
  resources :tenants, only: [:index, :create, :update, :destroy]
  resources :apartments, only: [:index, :create, :update, :destroy]
end

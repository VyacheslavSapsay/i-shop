Rails.application.routes.draw do
  root 'products#index'
  resources :products

  scope '/admin' do
    resources :categories, controller: 'backoffice/categories', as: "admin_categories"
    resources :products, controller: 'backoffice/products', as: "admin_products"
  end

end

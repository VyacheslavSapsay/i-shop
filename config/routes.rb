Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
    resources :orders
    resources :cart_items
    root 'products#index'
    resources :carts do
      collection do
        get 'plus_quantity'
        get 'minus_quantity'
      end
    end
    resources :products do
      get 'buy', to: 'cart_items#create', as: 'buy'
      resources :comments
      resources :images
    end

    resources :categories

    scope '/admin' do
      resources :categories, controller: 'backoffice/categories', as: "admin_categories" do
        collection do
          get 'choose_category'
        end
      end
      resources :products, controller: 'backoffice/products', as: "admin_products"
      resources :orders, controller: 'backoffice/orders', as: 'admin_orders'
    end

      resources :users
      resources :sessions

      get 'signup', to: 'users#new', as: 'signup'
      get 'login', to: 'sessions#new', as: 'login'
      get 'logout', to: 'sessions#destroy', as: 'logout'
    end
end

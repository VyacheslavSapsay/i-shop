Rails.application.routes.draw do
  resources :orders do
    collection do
    get 'unloged_user'
    get 'new2'
  end
  end
  resources :cart_items
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
    root 'products#index'
    resources :carts do
      collection do
        get 'plus_quantity'
        get 'minus_quantity'
        get 'show_unloged_user'
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
    end

      resources :users
      resources :sessions

      get 'signup', to: 'users#new', as: 'signup'
      get 'login', to: 'sessions#new', as: 'login'
      get 'logout', to: 'sessions#destroy', as: 'logout'
    end
end

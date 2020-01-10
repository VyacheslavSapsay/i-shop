Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/, defaults: {locale: "en"} do
    root 'products#index'
    resources :products do
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

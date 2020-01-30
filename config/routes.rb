Rails.application.routes.draw do
  namespace :api do
    post 'signup_user' => 'authentication#signup_user'
    post 'login_user' => 'authentication#login_user'
    delete 'logout_user' => 'authentication#logout_user'
    post 'signup_admin' => 'authentication#signup_admin'
    post 'login_admin' => 'authentication#login_admin'
    delete 'logout_admin' => 'authentication#logout_admin'
    resources :cart, only: [:index] do
      collection do
        post 'create_cart/:id' => 'cart#create_cart'
      end
    end
    resources :category, only: [:create, :index ]
    resources :product, only: [:index,:show] do
      collection do
        post 'create_product/:id' => 'product#create_product'
      end
    end
  end
end

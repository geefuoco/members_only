Rails.application.routes.draw do
  resources :secrets

  devise_for :users, controllers: { registrations: "registrations"}

  authenticated do
    root "secrets#index", as: "authenticated_root"
  end

  unauthenticated do 
    root "home#index"
  end

end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}

  authenticated do
    root "home#visitor", as: "authenticated_root"
  end

  unauthenticated do 
    root "home#index"
  end

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cinemas, only: [:show]

  resources :sessions, only: [:index, :new, :create] do
    resources :halls, only: [:show] do
      resources :bookings, only: [:create]
    end
  end
end

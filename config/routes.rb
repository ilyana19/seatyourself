Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :restaurants do
    resources :reservations, except: [:index, :new, :show ]
  end

  root 'restaurants#index'
end

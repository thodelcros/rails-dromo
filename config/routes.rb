Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :itineraries, only: [:index, :show]

  resources :points, only:[] do
    resources :favorites, only: [:create, :destroy]
  end

  namespace :owner do
    resources :itineraries do
      member do
        patch :share
      end

      resources :points, only: [:create, :update, :destroy]
    end

    resources :favorites, only: [:index, :destroy] do
      collection do
        get :country
      end
    end
  end
end

Rails.application.routes.draw do
  get 'schools/show'

  devise_scope :user do
    authenticated :user do
      root to: 'schools#show', as: :authenticated_root
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    devise_for :users
  end

  resources :school_unities
  resources :school_classes
end

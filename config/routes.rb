Rails.application.routes.draw do
  # top to bottom - specific to less specific
  resources :genres
  resources :quotes
  resources :books
  
  resources :books, only: [:show] do
    resources :quotes, only: [:new, :edit, :update]
  end

  resources :books, only: [:show] do
    resources :genres, only: [:new, :edit]
  end

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth' }

  root to: "application#home"

end

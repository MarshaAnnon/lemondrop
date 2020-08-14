Rails.application.routes.draw do
  resources :genres
  resources :quotes
  resources :books
  
  resources :books, only: [:show] do
    resources :quotes, only: [:index, :new, :edit]
  end

  resources :books, only: [:show] do
    resources :genres, only: [:new, :edit]
  end

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth' }

  root to: "application#home"

end

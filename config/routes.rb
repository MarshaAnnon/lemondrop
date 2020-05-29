Rails.application.routes.draw do
  
  resources :categories
  resources :quotes
  resources :books
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth' }
  root to: "application#home"
  
end

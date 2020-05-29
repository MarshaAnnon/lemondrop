Rails.application.routes.draw do
  
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'omniauth' }
  root to: "application#home"
  
end

Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
 
  resources :skill_managements do
    resources :skill
  end
  resource :mypages
  resources :users
  resources :managements
  resources :clients
  resources :projects
  resources :wages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

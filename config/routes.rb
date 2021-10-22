Rails.application.routes.draw do

  get 'skill_managements/show'
  get 'skill_managements/edit'
  root 'homes#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    resource :managements
    resources :users
  end

  resource :mypages
  resource :skill_managements
  resources :managements
  resources :users
  resources :clients
  resources :projects

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/sidekiq'

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
  resources :mypages
  # resources :users do
  #   put :suspended
  # end
  resources :managements do
    collection do
      match 'search' => 'managements#search', via: [:get, :post], as: :search
    end
  end
  resources :users do
    collection do
      match 'search' => 'users#search', via: [:get, :post], as: :search
    end
  end
  resources :clients
  resources :projects
  resources :wages
  resources :letters ,only: [:index]

  get 'managements/:id/state', to: 'managements#state', as: 'user_state'
  get 'managements/:id/wagestate', to: 'managements#wagestate', as: 'wage_state'
  get '/patients/:id', to: 'patients#show', as: 'patient'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

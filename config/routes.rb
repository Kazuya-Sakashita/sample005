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
  resources :mypages
  # resources :users do
  #   put :suspended
  # end
  resources :managements
  resources :users
  resources :clients
  resources :projects
  resources :wages

  get 'managements/:id/state', to: 'managements#state', as:'user_state'
  get '/patients/:id', to: 'patients#show', as: 'patient'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

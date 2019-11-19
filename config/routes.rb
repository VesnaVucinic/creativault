Rails.application.routes.draw do

  root "sessions#new"
  get 'sessions/new', to: 'sessions#new', as: 'new_session'
  post 'sessions/create', to: 'sessions#create', as: 'create_session'
  post 'sessions', to: 'sessions#destroy', as: 'destroy_session'
  post 'comments', to: 'comments#create', as: 'comment'

  resources :creations, only:[:index, :show]

  resources :users do
    resources :creations
    resources :profiles, only:[:new, :edit, :create, :update]
  end

end

Rails.application.routes.draw do
  resources :events, only: %i[index new create show]
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[create]
  get '/login', to: 'sessions#new', as: 'new_session'

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

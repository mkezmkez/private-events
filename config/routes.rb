Rails.application.routes.draw do
  resources :events, only: %i[index new create show]
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[create destroy]
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/events', to: 'events#new_guest', as: 'new_guest'
  delete '/logout',  to: 'sessions#destroy'

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

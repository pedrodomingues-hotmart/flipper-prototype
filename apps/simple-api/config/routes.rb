Rails.application.routes.draw do
  get '/status', to: 'status#status'

  resources :users, only: [:show]

  resource :feature, only: [] do
    get '/alpha', to: 'feature#alpha'
    get '/beta/:id', to: 'feature#beta'
    get '/vip/:id', to: 'feature#vip'
  end
end

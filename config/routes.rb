Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'

  get '/dojos', to: 'dojos#index'
  get '/dojos/:id', to: 'dojos#show'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'

  get '/dojos', to: 'dojos#index'
  get '/dojos/:id', to: 'dojos#show'

  get '/instructors', to: 'instructors#index'
  get '/instructors/:id', to: 'instructors#show'

  get '/seeds', to: 'seeds#index'
  get '/seeds/:id', to: 'seeds#show'

  get '/dojos/:id/instructors', to: 'dojo_instructors#index'

  get '/companies/:id/seeds', to: 'company_seeds#index'
end

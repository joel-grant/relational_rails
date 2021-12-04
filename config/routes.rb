Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  get '/companies/:id', to: 'companies#show'
  post '/companies', to: 'companies#create'
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'

  get '/dojos', to: 'dojos#index'
  get '/dojos/new', to: 'dojos#new'
  get '/dojos/:id', to: 'dojos#show'
  post '/dojos', to: 'dojos#create'
  get '/dojos/:id/edit', to: 'dojos#edit'
  patch '/dojos/:id', to: 'dojos#update'

  get '/instructors', to: 'instructors#index'
  get '/instructors/:id', to: 'instructors#show'

  get '/seeds', to: 'seeds#index'
  get '/seeds/:id', to: 'seeds#show'

  get '/dojos/:id/instructors', to: 'dojo_instructors#index'

  get '/companies/:id/seeds', to: 'company_seeds#index'

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  get '/companies/:id', to: 'companies#show'
  post '/companies', to: 'companies#create'
  get '/companies/:id/seeds/new', to: 'company_seeds#new'
  post '/companies/:id/seeds', to: 'company_seeds#create'
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'

  get '/dojos', to: 'dojos#index'
  get '/dojos/new', to: 'dojos#new'
  get '/dojos/:id', to: 'dojos#show'
  post '/dojos', to: 'dojos#create'
  get '/dojos/:id/instructors/new', to: 'dojo_instructors#new'
  post '/dojos/:id/instructors', to: 'dojo_instructors#create'
  get '/dojos/:id/edit', to: 'dojos#edit'
  patch '/dojos/:id', to: 'dojos#update'
  delete '/dojos/:id', to: 'dojos#destroy'

  get '/instructors', to: 'instructors#index'
  get '/instructors/:id', to: 'instructors#show'
  get '/instructors/:id/edit', to: 'instructors#edit'
  patch '/instructors/:id', to: 'instructors#update'

  get '/seeds', to: 'seeds#index'
  get '/seeds/:id', to: 'seeds#show'
  get '/seeds/:id/edit', to: 'seeds#edit'
  patch '/seeds/:id', to: 'seeds#update'

  get '/dojos/:id/instructors', to: 'dojo_instructors#index'

  get '/companies/:id/seeds', to: 'company_seeds#index'

end

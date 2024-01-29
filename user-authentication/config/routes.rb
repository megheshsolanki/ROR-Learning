Rails.application.routes.draw do
  get '/user', to: "users#show"
  get '/users', to: "users#index"
  post '/register', to: "users#create"
  post '/login', to: 'authentication#login'
end

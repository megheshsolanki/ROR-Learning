Rails.application.routes.draw do
  get '/user', to: "users#show"
  get '/users', to: "users#index"
  post '/register', to: "users#create"
  post '/login', to: 'authentication#login'

  post '/tasks', to: "tasks#create"
  get '/tasks/:id', to: "tasks#show"
  get '/tasks', to: "tasks#get_all"
  put '/tasks/:id', to: "tasks#update"
  delete '/tasks/:id', to: "tasks#destroy"

  get '/weather/:city', to: "weather#get_weather"
end

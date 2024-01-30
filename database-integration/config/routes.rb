Rails.application.routes.draw do

  post '/tasks', to: "tasks#create"
  get '/tasks/:id', to: "tasks#show"
  get '/tasks', to: "tasks#get_all"
  put '/tasks/:id', to: "tasks#update"
  delete '/tasks/:id', to: "tasks#destroy"
end

Rails.application.routes.draw do
 post "/register", to: 'user#create'
 post "/login", to: 'authentication#login'
 get "/show", to: 'user#show'
 post "/upload", to: 'upload#create'
end

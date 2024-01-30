Rails.application.routes.draw do
  
  get '/weather/:city', to: "weather#get_weather"
end

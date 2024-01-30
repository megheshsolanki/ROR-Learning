class WeatherController < ApplicationController

    include HTTParty
    def get_weather 
        response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?q=#{params[:city]}&appid=#{ENV["API_KEY"]}")

        render json: response.body, status: response.code
    end
end
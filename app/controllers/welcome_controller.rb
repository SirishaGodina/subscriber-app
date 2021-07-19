class WelcomeController < ApplicationController
	require 'httparty'
	def index
          response = HTTParty.get("http://127.0.0.1:3000/users")
          render json: response.body
	end
end
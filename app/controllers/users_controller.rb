class UsersController < ApplicationController
	require 'httparty'
	def email_sms_service_users
          response = HTTParty.get("http://127.0.0.1:3000/users")
          render json: response.body
	end

	
end

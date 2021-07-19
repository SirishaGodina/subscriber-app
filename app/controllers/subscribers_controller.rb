
class SubscribersController < ApplicationController
  require 'httparty'
	skip_before_action :verify_authenticity_token
	def create
    @subscriber = Subscriber.new
    @subscriber.name = params[:name]
    @subscriber.mail = params[:mail]
    @subscriber.phone_no = params[:phone_no]
    if @subscriber.save
      render json: @subscriber, status: :created
    else
      render json: { errors: @subscriber.errors.full_messages }, status: :unprocessable_entity
    end
    end
	def send_mail
      @subscriber = Subscriber.find_by_mail(params[:mail])
       response = HTTParty.post("http://localhost:3000/users/send_mail",
       body: @subscriber.as_json)
       if response.code == 204
        render json: 'Sent Email'
        else
        render json: 'Error'
        end
	end
  def send_sms
    phone_no = params[:phone_no]
    response = HTTParty.post("http://localhost:3000/users/send_sms", body: {"phone_no":phone_no})
    
    if response.code == 204
      render json: 'Sent SMS'
    else
      render json: 'Error'
    end
    
  end
end

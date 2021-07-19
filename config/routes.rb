Rails.application.routes.draw do
  resources :suscribers
  root 'users#index'
  get '/users/email_sms_service_users', to: 'users#email_sms_service_users'
  get '/subscribers/send_mail', to: 'subscribers#send_mail'
  get '/subscribers/send_sms', to: 'subscribers#send_sms'
  resources :subscribers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

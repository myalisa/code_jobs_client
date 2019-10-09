class Client::SignUpsController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    response = HTTP.post('http://localhost:3000/api/users',
      form: {
              name: params[:name],
              email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation]
            }
            )

    redirect_to "/client/login"
  end

  def login_form
    render 'login_form.html.erb'
  end

  def login_create
    response = HTTP.post(
      'http://localhost:3000/api/sessions',
      form: {
        email: params[:email],
        password: params[:password]
      }
      )
    session[:jwt] = response.parse["jwt"]
    redirect_to "/client/jobs"
  end
end

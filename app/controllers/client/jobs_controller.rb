class Client::JobsController < ApplicationController
  def index
    # ===========================
    # message = session[:jwt]
    # render json: {message: message}
    # ===========================
    response = HTTP.get("http://localhost:3000/api/jobs")
    @jobs = response.parse
    render 'index.html.erb'  
  end





  def create
    response = HTTP.post(
                              "http://localhost:3000/api/jobs", 
                              form: {
                                      name: params[:name],
                                      locations: params[:locations],
                                      company: params[:company],
                                      publication_date: params[:publication_date],
                                      type: params[:type],
                                      summary: params[:summary]
                                    }
                              )
        @job = response.parse
        redirect_to "/client/jobs/#{@job["id"]}"
      
  end

  def show
    
    # =========================
      response = HTTP.get("http://localhost:3000/api/jobs/#{params[:id]}")
      @job = response.parse
      render 'show.html.erb'
  end

  def sign_up
    response = HTTP.get("http://localhost:3000/api/jobs/#{params[:id]}")
    @job = response.parse
    render 'show.html.erb'
    
  end



end

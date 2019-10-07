class Client::JobsController < ApplicationController
  def index
    response = HTTP.get("http://localhost:3000/api/jobs")
    @jobs = response.parse
    render 'index.html.erb'
    
  end
end

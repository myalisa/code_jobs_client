class Client::JobSearchesController < ApplicationController
  def index
    city = params[:city]
    state = params[:state]
    if city && state
      response = HTTP.get("http://localhost:3000/api/jobsearches?city=#{city}&state=#{state}")
    else
      response = HTTP.get("http://localhost:3000/api/jobsearches")
    end

    @search_results = response.parse
    render "index.html.erb"
    
  end
end

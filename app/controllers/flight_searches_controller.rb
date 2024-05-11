
class FlightSearchesController < ApplicationController
  def index
    # render your search form here
  end

  def new
  @search = FlightSearch.new
end

  def create
    @search = FlightSearch.new(search_params)
    if @search.save
      # Perform flight search using Priceline.com Provider API
      response = priceline_flight_search(@search)
      if response.success?
        @flights = parse_flight_search_results(response.body)
      else
        flash[:alert] = "Error: #{response.code} - #{response.message}"
        @flights = []
      end
      redirect_to @search
    else
      render :new
    end
  end
  private

def search_params
  params.require(:flight_search).permit(:origin, :destination, :departure_date)
end

def priceline_flight_search(search)
  url = "https://priceline-com-provider.p.rapidapi.com"
  options = {
    body: {
      origin: search.origin,
      destination: search.destination,
      departure_date: search.departure_date
    }.to_json,
    headers: {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{Rails.application.credentials.priceline_api_key}" # Replace with your actual API key
    }
  }

  HTTParty.post(url, options)
end

def parse_flight_search_results(response_body)
  # Parse the response body and extract flight information
  # Example: JSON.parse(response_body)
  # Return an array of flight objects
end
end
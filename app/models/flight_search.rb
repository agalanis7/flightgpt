class FlightSearch < ApplicationRecord
    include HTTParty
    base_uri 'https://priceline-com-provider.p.rapidapi.com/flights'
  
    def self.search_flights(params)
      headers = {
        "X-RapidAPI-Host" => "https://priceline-com-provider.p.rapidapi.com/v1/flights/search",
        "X-RapidAPI-Key" => ENV["RAPIDAPI_KEY"]
      }
      options = {
        query: {
          'origin' => params[:origin],
          'destination' => params[:destination],
          'date' => params[:date],
          # Add more parameters as needed
        },
        headers: headers
      }
      response = post("/search", options)
      JSON.parse(response.body)
    end
  end
  
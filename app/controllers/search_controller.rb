class SearchController < ApplicationController
  def index
  @q=params[:q]  
  @apiKey="FrmKAzEVQQLWTvp17K7LaGnWRWuw02DhapJhbbK0" 
  @num_foods = 10
  url ="http://api.nal.usda.gov/ndb/search/?format=json&q="+@q+"&sort=n&max=25&offset=0&api_key="+@apiKey
  response_resource = RestClient::Resource.new(url) #from what i understand it creates a RESTCLIENT object we can manipulate using the classes methods
  response=response_resource.get
  response_JSON = JSON.parse(response) #creates a ruby hash table out of the JSON object
   @response=Array.new 
   10.times do |i|
      @response[i] = response_JSON ['list']['item'][i]["name"]
    end
  end
  def search
  end 
end

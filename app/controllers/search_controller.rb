class SearchController < ApplicationController
  def index
  @q=params[:q]  
  @apiKey="FrmKAzEVQQLWTvp17K7LaGnWRWuw02DhapJhbbK0" 
  @num_foods = 10
  foodsUrl ="http://api.nal.usda.gov/ndb/search/?format=json&q="+@q+"&sort=n&max=25&offset=0&api_key="+@apiKey
  response_resource = RestClient::Resource.new(foodsUrl) #from what i understand it creates a RESTCLIENT object we can manipulate using the classes methods
  response=response_resource.get
  @response_JSON = JSON.parse(response) #creates a ruby hash table out of the JSON object
   @nutrientHash={} 
   3.times do |i|
       ndbno=@response_JSON['list']['item'][i]['ndbno']
       nutrientUrl="http://api.nal.usda.gov/ndb/reports/?ndbno="+ndbno+"&type=b&format=json&api_key="+@apiKey
        nutrients_JSON=JSON.parse(RestClient::Resource.new(nutrientUrl).get)
	name = @response_JSON['list']['item'][i]['name']
	@nutrientHash[i] = {"name"=>name,"calories" => nutrients_JSON['report']['food']['nutrients'][1]['value'],
	"protein" => nutrients_JSON['report']['food']['nutrients'][2]['value'],
	"fat" =>  nutrients_JSON['report']['food']['nutrients'][3]['value'] }	
    end
  end
  def search
  end 
end

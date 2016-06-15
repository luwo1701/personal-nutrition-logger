class FoodsController < ApplicationController
  def new
  	@food_group = FoodGroup.all
  	@q=params[:q]
  	@group = params[:groupChosen]  
  	@apiKey="FrmKAzEVQQLWTvp17K7LaGnWRWuw02DhapJhbbK0" 
  	@num_foods = 10
  	foodsUrl ="http://api.nal.usda.gov/ndb/search/?format=json&q="+@q+"&fg=Baked%20Products&sort=n&max=25&offset=0&api_key="+@apiKey
	
  	@nutrientHash={}  
  
   response_resource = RestClient::Resource.new(foodsUrl) #from what i understand it creates a RESTCLIENT object we can manipulate using the classes methods 
   #404 code means resource not found.
   response_resource.get{|response,request,result,&block|
	@code = response.code
 }
   if @code!=404
   	response = RestClient::Resource.new(foodsUrl)
   	response = response.get
   	@response_JSON = JSON.parse(response) #JSON.parse(@response) #creates a ruby hash table out of the JSON object 
   		3.times do |i|
      	ndbno=@response_JSON['list']['item'][i]['ndbno']
      	nutrientUrl="http://api.nal.usda.gov/ndb/reports/?ndbno="+ndbno+"&type=b&format=json&api_key="+@apiKey
      	nutrients_JSON=JSON.parse(RestClient::Resource.new(nutrientUrl).get)
				name = @response_JSON['list']['item'][i]['name']
				@nutrientHash[i] = {"name"=>name,"calories" => nutrients_JSON['report']['food']['nutrients'][1]['value']}

#,"protein" => nutrients_JSON['report']['food']['nutrients'][2]['value'],"fat" =>  nutrients_JSON['report']['food']['nutrients'][3]['value'] }	
    	end
    else
    @nutrientHash[0] = {"name" => "not found","calories"=> "not found","protein"=> "not found","fat"=> "not found"} 
    
    end
  end

  def search
  end
	def index
	end
	
	def create
		@user = User.find_by_id(session[:user_id])
	 	@food = @user.foods.build(name: "butter", calories: 100)
		render plain: "food created " + User.find_by_id(session[:user_id]).name#User.find_by_id(params[:session][:user_id])
	end
  private
      def food_params
         params.require(:food).permit(:name,:calories)
      end

end

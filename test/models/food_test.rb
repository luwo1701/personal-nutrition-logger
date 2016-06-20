require 'test_helper'

class FoodTest < ActiveSupport::TestCase
  def setup
		@user = User.new(name:"Luke",email:"user@example.com",password:"rollerblader")
		@user.save
		#with the presence of has_many and belongs_to we have new methods, foods is table that has_many relationship with user
		@food = @user.foods.build(name:"butter",calories:400)
    Rails::logger.debug @food.user_id
	end

	test "food should be valid" do
		assert @food.valid?
	end

	
	test "user id present" do
		@food.user_id = nil
		assert_not @food.valid?
	end
	
	test "order is in most recently added first" do
	#:most_recent is a specific instance of foods stated in the foods.yaml file	
		assert_equal foods(:most_recent), Food.first
	end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Example", email: "user@example.com", password:  "roll")
		@user.save
	end

	test "name shouldn't be blank" do
		@user.name=("")
		assert @user.valid?
	end
	test "password is present" do
		@user.password = (" ") 
		assert_not @user.valid?
	end	
end

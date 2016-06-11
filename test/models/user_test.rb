require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Example", email: "user@example.com", password:  "roll")
	end

	test "should be valid" do
		@user.name=("   ")
		assert @user.valid?
	end
	test "password is present" do
		@user.password = (" ") 
		assert_not @user.valid?
	end	
end

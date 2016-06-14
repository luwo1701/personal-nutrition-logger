class Food < ActiveRecord::Base
	belongs_to :user
	
	#orders our foods database in descending order by our created_at entry
	default_scope -> {order(created_at: :desc)}
	
	#ensures a food has a user_id associated with it
	validates :user_id, presence:true
	validates :name, presence:true
	validates :calories, presence:true
end

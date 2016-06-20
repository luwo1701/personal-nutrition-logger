class User < ActiveRecord::Base
  has_many :foods, dependent: :destroy
	#the before_save method ensures all emails are lowercase so they can be compared easier
	before_save {self.email = email.downcase}
	
	#regex ensures email entered is reasonable
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 30}
	validates :email, presence: true, length: {maximum: 50},format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }
	validates :password, presence: true
	
	#method from bcrypt gem
	has_secure_password
end

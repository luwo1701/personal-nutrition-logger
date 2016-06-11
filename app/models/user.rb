class User < ActiveRecord::Base
  #the before_save method ensures all emails are lowercase so they can be compared easier
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 30}
	validates :email, presence: true, length: {maximum: 50},format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false }

	has_secure_password
end

class User < ActiveRecord::Base
	has_secure_password
	# has_many :books, dependent: :destroy
	# has_many :user_reviews, dependent: :destroy
end
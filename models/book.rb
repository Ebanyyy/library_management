class Book <ActiveRecord::Base
	has_many :reviews
	belongs_to :user 
	# has_many :users, through: :user_reviews

	# validates_presence_of :title
	# validates_presence_of :author
end
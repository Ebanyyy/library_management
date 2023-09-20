class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :book
end









# class Review < ActiveRecord::Base
# 	belongs_to :book, required: true
# 	validates :score, numericality: {
# 		only_integer: true
# 		greater_than_or_equal_to: 1,
# 		less_than_or_equal_to: 5
# 	}
# end


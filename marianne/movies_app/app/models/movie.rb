class Movie < ActiveRecord::Base
	validates :title, presence: true
	validates :description, presence: true, presence: true, length: { minimum: 10 }
	validates :year_released, numericality: { only_integer: true, greater_than: 0 }
	validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
	def self.search_for (query)
		where('title LIKE :query OR description LIKE :query OR year_released LIKE :query', query: "%#{query}%")
	end
end

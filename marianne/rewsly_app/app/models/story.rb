class Story < ActiveRecord::Base
	validates :title, :link, :upvotes, :category, presence: true
	validates :upvotes, numericality: { only_integer: true }
	def self.search_for (query)
		where('title LIKE :query OR category LIKE :query', query: "%#{query}%")
	end
end

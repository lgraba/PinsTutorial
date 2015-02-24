class Pin < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	attr_accessor :search

	# Search Functionality
	def self.search(query)
		# where(:title, query) Would return an exact match, when we just want like-matches.
		where("title like ?", "%#{query}%")
	end
end

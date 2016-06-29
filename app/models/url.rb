class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :original, uniqueness:{case_sensitive: false}

before_create :shorten_it

	def shorten_it
		self.shorten =SecureRandom.hex(3)
	end
end


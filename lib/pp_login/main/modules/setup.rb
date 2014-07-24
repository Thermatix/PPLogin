module PpLogin
	class << self #stores config variables
		attr_accessor :id, :secret, :website_url, :mode, :loginURL, :scope
	end

	def self.setup(&block) #setup function for initializer file
		yield self
	end
end
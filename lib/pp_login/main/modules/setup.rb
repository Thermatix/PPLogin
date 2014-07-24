module PpLogin
	class << self #stores config variables
		attr_accessor :id, :secret, :website_url, :redirect_url, :mode, :loginURL, :scope
	end

	def self.setup(&block) #setup function for initializer file
		yield self
		self.redirect_url = self.website_url if !self.redirect_url
	end
end
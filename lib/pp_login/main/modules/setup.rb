module PpLogin
	class << self #stores config variables
		attr_accessor :id, :secret, :website_url, :redirect_url, :mode, :loginURL, :scope, :token_store, :token_model, :user_store, :user_model
	end

	def self.setup(&block) #setup function for initializer file
		yield self
		self.redirect_url = self.website_url if !self.redirect_url
		self.token_store = :session if !self.token_store
	end
end
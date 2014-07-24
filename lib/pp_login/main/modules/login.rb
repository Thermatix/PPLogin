module PpLogin


	class Engine < ::Rails::Engine

		def self.get_access_token(t)
			Tokeninfo.create(t)
		end

		def refresh_token
			Tokeninfo.refresh
		end

		def refresh_token(t)
			Tokeninfo.refresh(t)
		end


	end

end
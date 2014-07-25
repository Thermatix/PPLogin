module PpLogin
	#need to re-arange code to allow theese functions to be used freely within the PpLogin namespace
	class Engine < ::Rails::Engine

		def self.get_access_token(code)
			return Tokeninfo.create(code)
		end

		def self.refresh_token(refresh_token)
			return Tokeninfo.refresh(refresh_token)
		end

		def self.get_user_info(access_token)
			return Userinfo.get(access_token)
		end

	end

end

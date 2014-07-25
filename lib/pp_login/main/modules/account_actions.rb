module PpLogin

	def self.get_access_token(code)
		return Engine.instance_exec(code){|c| return self::Tokeninfo.create(c) }
	end

	def self.refresh_token(refresh_token)
		return Engine.instance_exec(refresh_token){|rt| self::Tokeninfo.refresh(rt) }
	end

	def self.get_user_info(access_token)
		return Engine.instance_exec(get_access_token){|at| self::Userinfo.get(at) }
	end

end

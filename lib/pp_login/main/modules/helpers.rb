module PpLogin
	module Helpers
		def self.included(base)
			base.send :helper_method, :user_info, :token
		end
		
		#need to DRY up this code. consider moving for_action from PpAccountController to the PpLogin namespace.
		def user_info
			case(PpLogin.user_store)
			when :param
				JSON.parse(params[:user])
			when :session
				JSON.parse(session[:user])
			when :cookie
				JSON.parse(cookies[:user])
			when :db
				p 'This Method of saving is not yet implimented'
			end
		end

		def token
			case(PpLogin.token_store)
			when :param
				JSON.parse(params[:token])
			when :session
				JSON.parse(session[:token])
			when :cookie
				JSON.parse(cookies[:token])
			when :db
				p 'This Method of saving is not yet implimented'
			end
		end
	end
end

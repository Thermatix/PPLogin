module PpLogin
	module Helpers
		def self.included(base)
			base.send :helper_method, :user_info, :token, :paypal_login
		end

		def for_action manual
			@to_return ||= begin
				case(manual || action_name)
				when 'get_token', 'refresh_token'
					return {store: PpLogin.token_store, type: :token}
				when 'user_info'
					return {store: PpLogin.user_store, type: :user}
				end
			end
		end

		def user_info
			get_info('get_token')
		end



		def token
			get_info('get_token')
		end

    def paypal_login type, prop={}
    	self.instance_exec(type,prop) do |type,prop|
    		case(type)
    		when :link
    			link_to prop[:text]||'Login With PayPal',PpLogin.loginURL, prop
    		when :button
    			button_to prop[:text]||'Login With PayPal',PpLogin.loginURL, prop
    		end
    	end
    end

		private

			def get_info(kind)
				case(for_action(kind)[:store])
				when :param
					JSON.parse(params[for_action[:type]])
				when :session
					JSON.parse(session[for_action[:type]])
				when :cookie
					JSON.parse(cookies[for_action[:type]])
				when :db
					p 'This Method of saving is not yet implimented'
				end
			end
	end
end

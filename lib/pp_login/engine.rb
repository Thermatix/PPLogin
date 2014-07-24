require 'paypal-sdk-rest'
require 'awesome_print'
require_relative 'main/main'
module PpLogin
  class Engine < ::Rails::Engine
  	include PayPal::SDK::OpenIDConnect
    isolate_namespace PpLogin
    initializer "pp_login.configure_rails_initialization" do |app|
    	self.config.after_initialize do
    		PayPal::SDK.configure({
    			openid_client_id: PpLogin.id,
    			openid_client_secret: PpLogin.secret,
    			openid_redirect_uri: PpLogin.website_url + '/pp_login/get_token',
    			mode: PpLogin.mode,
    			})
    			scope = PpLogin.scope || 'openid email'
    			PpLogin.loginURL = Tokeninfo.authorize_url( scope: scope)
    	end
    end
  end
end

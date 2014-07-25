module PpLogin
  class PpAccountController < ApplicationController

  	def get_token
  		token = get_access_token(token_params[:code])
  		save_info(token)
  	end

  	def refresh_token
  		token = refresh_token(token_params[:refresh_token])
  		save_info(token)
  	end

  	def user_info
  		user_info = get_user_info(token_params[:access_token])
  		save_info(user_info)
  	end

  	def logout
  		token = refresh_token(token_params[:refresh_token])
  		redirect_to token.logout_url
  	end

  	protected
  		def token_params
  			{ token_type: params[:token_type] ,expires_in: params[:expires_in] ,refresh_token: params[:refresh_token] ,access_token: params[:access_token], code: params[:code] }
  		end

  		def save_info(info)
  			case(for_action[:store])
  			when :param
  				redirect_to PpLogin.redirect_url({ :"#{for_action[:type]}" => info.to_json})
  			when :session
  				session[for_action[:type]] = info.to_json
  				redirect_to PpLogin.redirect_url
  			when :cookie
  				cookies[for_action[:type]] = info.to_json
  				redirect_to PpLogin.redirect_url
  			when :db
  				p 'This Method of saving is not yet implimented'
  				redirect_to PpLogin.redirect_url
  			end

  		end
  end
end

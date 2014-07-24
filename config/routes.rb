PpLogin::Engine.routes.draw do
	get 'get_token', to: 'pp_account#get_token', as: :get_token

	get 'refresh_token/:refresh_token', to: 'pp_account#refresh_token', as: :refresh_token

	get 'user_info/:access_token', to: 'pp_account#user_info', as: :user_info

	get 'logout/:refresh_token', to: 'pp_account#logout', as: :logout

end

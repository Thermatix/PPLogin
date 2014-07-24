PpLogin::Engine.routes.draw do
	get 'token', to: 'login#token'
end

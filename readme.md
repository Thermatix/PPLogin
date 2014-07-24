

To install and setup just follow the following:

add to routes: 
```
mount PpLogin::Engine => "/pp_login"
```

for setup in an initializer file put in

```
PpLogin.setup do |config|
  config.id = "PayPal App ID"
  config.secret = "PayPal App secret"
  config.website_url = "website_URL" #just put your website URL here, just let the engine handle the rest.
  config.redirect_url = 'redirect_url' #put here where you want the engine to redirect to after it's gotten the access token/user_info, if left out it defaults to the website_url.
  config.mode = "sandbox" #or 'live'
  config.scope = 'scope' #not really needed as it defaults to 'openid email'
  config.token_store = :param # or :session, :cookie, :db, will default to :session if no value is supplied. How you want the engine to deal with the access token, see token store to understand the different options. 
  config.token_model = :model_name # if token_Store is set to :db then this is the name of the model to store it into.
  config.user_store = :param #same as token_store
  condif.user_model = :model_name #same as token_model
end
```

The helpers are:

- get_token_path = the path that PayPal will redirect to after the user has logged into, you shouldn't need to use this..
- refresh_token_path = the path you can use to refresh the access token (expects `:refresh_token` param).
- user_info_path = the path you can use to retrieve user info (expects 
`:access_token` param)
- logout_path = the path you can use to logout the user (expects 
`:refresh_token` param).

To use the following helpers include `PpLogin::Helpers` within your application_controller, they should be immediately available within the views and controllers.


- user_info = will automatically return the user info after having been re-directed from the engine

- token = will automatically return the token values after having been re-directed by from the engine
Token Store

There are several methods to deal with the token
- :param, will return token values as a param in the URL bar `:token`/`:user`, it's pre-parsed to json. (not secure)
- :session, will store token in session under `:token`/`:user`, it's pre-parsed to json.
- :cookie, will store token in cookies under `:token`/`:user`,it's pre-parsed to json.
- :db, will store token into DB model that you supply (not implemented yet)
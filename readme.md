

To install:

add to routes: 
```
mount PpLogin::Engine => "/pp_login"
```

for setup in an intializer file put in

```
PpLogin.setup do |config|
  config.id = "PayPal App ID"
  config.secret = "PayPal App secret"
  config.website_url = "website_URL" #just put your website URL here, just let the engine handle the rest.
  config.redirect_url = 'redirect_url' #put here where you want the engine to redirect to after it's gotten the access token if left out it defaults to the website_url.
  config.mode = "sandbox" #or 'live'
  condig.scope = 'scope' #not really needed as it defaults to 'openid email'
end
```
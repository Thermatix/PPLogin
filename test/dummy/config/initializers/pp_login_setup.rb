PpLogin.setup do |config|
  config.id = "PayPal App ID"
  config.secret = "PayPal App secret"
  config.website_url ="Redirect URI goes here"
  config.mode = "sandbox" #or 'live'
end


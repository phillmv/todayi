class Service::Foursquare < Service

  REDIRECT_URL = "https://foursquare.com/oauth2/authenticate"
  ACCESS_URL = "https://foursquare.com/oauth2/access_token"

  CLIENT_ID = ENV['FOURSQUARE_CLIENT_ID']
  CLIENT_SECRET = ENV['FOURSQUARE_CLIENT_SECRET']

  def self.ident
    :foursquare
  end
end

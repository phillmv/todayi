require 'addressable/uri'
class Service < ActiveRecord::Base
  @@urls = Rails.application.routes.url_helpers
  belongs_to :user

  attr_accessible :type, :user_id

  SERVICES = { :foursquare => Foursquare }.with_indifferent_access

  def self.pick(service)
    SERVICES[service]
  end

  def self.redirect_url
    url = self.url_for(self::REDIRECT_URL,
                       :client_id => self::CLIENT_ID,
                       :response_type => 'code',
                       :redirect_uri => @@urls.oauth_callback_url(self.ident))
  end

  def self.url_for(url, hsh)
    uri = Addressable::URI.parse(url)
    uri.query_values = hsh
    uri.to_s
  end


  def obtain_access!(code)
    callback_url = @@urls.oauth_callback_url(self.class.ident)

    url = Service.url_for(self.class::ACCESS_URL,
                          :client_id => self.class::CLIENT_ID,
                          :client_secret => self.class::CLIENT_SECRET,
                          :grant_type => 'authorization_code',
                          :redirect_uri => callback_url,
                          :code => code)

    resp = HTTParty.get(url)
    if resp["error"]
      self.latest_error = resp[:error]
    else
      self.latest_error = nil
      self.access_token = resp["access_token"]
    end
    self.save!
  end
end

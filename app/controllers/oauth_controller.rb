class OauthController < ApplicationController
  before_filter :require_login

  def begin
    session[:redirect_back] = request.referer

    provider = Service.pick(params[:provider])
    if provider
      redirect_to provider.redirect_url
    else
      not_found
    end
  end

  def callback
     if params[:error] || params[:code].nil?
       raise Exception.new(params[:error])
     else
       provider = Service.pick(params[:provider]) || not_found
       service = current_user.services.find_or_create_by_type(provider)
       service.obtain_access!(params[:code])
       redirect_to session[:redirect_back]
     end
  end
end

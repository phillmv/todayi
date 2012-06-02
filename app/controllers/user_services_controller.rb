class UserServicesController < ApplicationController
  def new
    @service = UserService.new
  end
end

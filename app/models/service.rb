class Service < ActiveRecord::Base
  has_many :user_services
  has_many :users, :through => :user_services


  attr_accessible :description, :homepage, :name, :type
end

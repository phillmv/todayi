class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :user_services
  has_many :services, :through => :user_services

  # attr_accessible :title, :body
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end

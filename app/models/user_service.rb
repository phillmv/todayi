class UserService < ActiveRecord::Base
  set_table_name :users_services
  belongs_to :user
  belongs_to :service

  attr_accessible :key, :secret, :service_id, :token, :user_id
end

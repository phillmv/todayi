class AddAccessTokenToServices < ActiveRecord::Migration
  def change
    add_column :services, :access_token, :string
    add_column :services, :refresh_token, :string
    add_column :services, :latest_error, :string
  end
end

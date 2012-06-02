class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :users_services do |t|
      t.integer :user_id
      t.integer :service_id
      t.text :key
      t.text :secret
      t.string :token

      t.timestamps
    end
  end
end

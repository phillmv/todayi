class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :type

      t.timestamps
    end

    add_index :services, :user_id
  end
end

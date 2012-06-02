class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :homepage
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end

class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles, id: false do |t|
      t.string :id, null: false
      t.string :license_plate
      t.timestamps
    end
    add_index :vehicles, :id, unique: true
  end
end

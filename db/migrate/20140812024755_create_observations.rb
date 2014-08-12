class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.belongs_to :location, index: true
      t.timestamps
    end
  end
end

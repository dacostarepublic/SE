class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :cine_id
      t.string :level
      t.integer :row
      t.integer :column

      t.timestamps
    end
  end
end

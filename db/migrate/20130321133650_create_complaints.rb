class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :booking_id
      t.text :problem
      t.boolean :resolved
      t.text :issues

      t.timestamps
    end
  end
end

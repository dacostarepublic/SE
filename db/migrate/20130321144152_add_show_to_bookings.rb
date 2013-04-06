class AddShowToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :show_id, :integer
  end
end

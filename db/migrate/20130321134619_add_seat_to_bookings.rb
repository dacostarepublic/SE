class AddSeatToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :seat_id, :integer
  end
end

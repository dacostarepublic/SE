class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :cine_id
      t.string :movie_imdb_code

      t.timestamps
    end
  end
end

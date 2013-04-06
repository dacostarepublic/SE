class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :id
      t.time :starts

      t.timestamps
    end
  end
end

class CreateCines < ActiveRecord::Migration
  def change
    create_table :cines do |t|
      t.integer :rows
      t.integer :columns
      t.integer :movie_id

      t.timestamps
    end
  end
end

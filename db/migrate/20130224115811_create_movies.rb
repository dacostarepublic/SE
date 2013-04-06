class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.float :rating
      t.integer :views
      t.string :trailer_url
      t.text :description
      t.string :age
      t.boolean :threeD
      t.date :release_date
      t.string :genres
      t.time :running_time
      t.string :directed_by
      t.string :produced_by
      t.text :starring
      t.string :imdb_code

      t.timestamps
    end
  end
end

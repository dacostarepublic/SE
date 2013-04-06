class CreateAgerestrictions < ActiveRecord::Migration
  def change
    create_table :agerestrictions do |t|
      t.string :name

      t.timestamps
    end
  end
end

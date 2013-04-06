class ChangeAgeToAgerestriction < ActiveRecord::Migration
  def up
  	rename_column :movies, :age, :agerestriction_id
  end

  def down
  	rename_column :movies, :agerestriction_id, :age
  end
end

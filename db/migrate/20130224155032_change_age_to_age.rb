class ChangeAgeToAge < ActiveRecord::Migration
  def up
  	change_column :movies, :age, :integer
  end

  def down
  	change_column :movies, :age, :string
  end
end

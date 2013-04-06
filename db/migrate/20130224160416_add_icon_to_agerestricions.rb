class AddIconToAgerestricions < ActiveRecord::Migration
    def self.up
    add_attachment :agerestrictions, :icon
  end

  def self.down
    remove_attachment :agerestrictions, :icon
  end
end

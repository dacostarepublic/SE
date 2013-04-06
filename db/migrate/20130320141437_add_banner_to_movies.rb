class AddBannerToMovies < ActiveRecord::Migration
  def self.up
    add_attachment :movies, :banner
  end

  def self.down
    remove_attachment :movies, :banner
  end
end

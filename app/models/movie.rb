class Movie < ActiveRecord::Base
	belongs_to :agerestriction
	has_one :cine
	attr_accessible :agerestriction_id, :description, :directed_by, :genres, :imdb_code, :produced_by, :rating, :release_date, :running_time, :starring, :threeD, :title, :trailer_url, :views, :poster
	has_attached_file :poster,:styles => {:thumb => "100x150", :medium => "214x317", :large => "600x900"}, :default_url => "/images/:style/poster.jpg"
	has_attached_file :banner, :styles => {:orig => "1356x529", :small => "500x300"}, :default_url => "/images/:style/banner.jpg"
end

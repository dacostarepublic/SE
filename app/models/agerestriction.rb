class Agerestriction < ActiveRecord::Base
	has_many :movies
  attr_accessible :name, :icon
  has_attached_file :icon, :styles => {:thumb => "100x38", :medium => "100x100", :large => "150x150"}, :default_url => "/images/:style/agerestriction.png"
  validates_attachment :icon, :attachment_content_type => {:content_type => ["image/png"]}
  validates_presence_of :icon, :name

end

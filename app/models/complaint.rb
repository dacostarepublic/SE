class Complaint < ActiveRecord::Base
	belongs_to :booking
  attr_accessible :booking_id, :issues, :problem, :resolved
end

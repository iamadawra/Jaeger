class VcRelation < ActiveRecord::Base
	validates_uniqueness_of :video_id, scope: :competition_id
	belongs_to :competition
	belongs_to :video
	has_one :video, :primary_key => :video_id, :foreign_key => :id
end

class VcRelation < ActiveRecord::Base
	validates_uniqueness_of :video_id, scope: :competition_id
end

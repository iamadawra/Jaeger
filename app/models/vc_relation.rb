class VcRelation < ActiveRecord::Base
	validate_uniqueness_of :video_id, :scope => :competition_id
end

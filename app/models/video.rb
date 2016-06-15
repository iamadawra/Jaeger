class Video < ActiveRecord::Base
  ratyrate_rateable 'visual_effects', 'entertainment'
  acts_as_votable
end

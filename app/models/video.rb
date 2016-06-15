class Video < ActiveRecord::Base
  ratyrate_rateable 'visual_effects', 'entertainment'
  validates_presence_of :title
  validates_presence_of :video_url
  validates_presence_of :poster_url
end

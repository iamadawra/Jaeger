class Video < ActiveRecord::Base
  ratyrate_rateable 'visual_effects', 'entertainment'
  validates_presence_of :title
  validates_presence_of :video_url
  validates_presence_of :poster_url

  before_save :clean_link

  def clean_link
    self.video_url = self.video_url.split('amazonaws.com/').last 
    self.poster_url = self.poster_url.split('amazonaws.com/').last
  end
end

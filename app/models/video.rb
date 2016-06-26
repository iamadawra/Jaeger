class Video < ActiveRecord::Base
  ratyrate_rateable 'visual_effects', 'entertainment'
  acts_as_votable

  validates_presence_of :title
  validates_presence_of :video_url
  validates_presence_of :poster_url

  validates_format_of :title, :with => /\A[0-9a-zA-Z\.\-\_]+\z/, :on => :create

  before_save :clean_link

  def clean_link
    self.video_url = self.video_url.split('amazonaws.com/').last 
    self.poster_url = self.poster_url.split('amazonaws.com/').last
  end

  def self.search(search)
    if search
      self.where("title like ?", "%#{search}%")
    else
      find(:all)
    end
  end
end

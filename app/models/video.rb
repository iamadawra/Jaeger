class Video < ActiveRecord::Base
  ratyrate_rateable 'visual_effects', 'entertainment'
  acts_as_votable
  has_many :vc_relations
  has_many :added_videos
  has_one :user, :primary_key => :uploader_id, :foreign_key => :id

  validates_presence_of :title
  validates_presence_of :video_url
  validates_presence_of :poster_url
  
  validates :title, length: { minimum: 2 }
  validates :title, length: { maximum: 50 }
  validates :video_desc, length: { maximum: 500 }

  validates_format_of :title, :with => /\A[0-9a-zA-Z\s\.\-\_]+\z/, :on => :create

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

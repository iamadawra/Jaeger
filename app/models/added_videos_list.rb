class AddedVideosList < ActiveRecord::Base
  belongs_to :add_videos_status
  belongs_to :competition
  has_many :added_videos
  before_create :set_status
  before_save :update_total

  def total
    added_videos.collect { |vi| vi.valid? ? 1 : 0 }.sum
  end
private
  def set_status
    self.add_videos_status_id = 1
  end

  def update_total
    self[:total] = total
  end
end

class AddedVideo < ActiveRecord::Base
  belongs_to :video
  belongs_to :added_videos_list

  validate :video_present
  validate :added_videos_list_present

  validates_uniqueness_of :video_id, scope: :added_videos_list_id, :message => "This video has already been added to the competition."

private
  def video_present
    if video.nil?
      errors.add(:video, "is not valid.")
    end
  end

  def added_videos_list_present
    if added_videos_list.nil?
      errors.add(:added_videos_list, "is not a valid added videos list.")
    end
  end
end

class AddUniqueIndexForAddedVideo < ActiveRecord::Migration
  def change
  	add_index :added_videos, [:video_id, :added_videos_list_id], :unique => true
  end
end

class DropUploadVideo < ActiveRecord::Migration
  def change
  	drop_table :upload_videos
  end
end

class CreateUploadVideos < ActiveRecord::Migration
  def change
    create_table :upload_videos do |t|
      t.string :title
      t.string :video_url
      t.string :poster_url
      t.string :tags
      t.string :video_desc
      t.string :is_approved

      t.timestamps null: false
    end
  end
end

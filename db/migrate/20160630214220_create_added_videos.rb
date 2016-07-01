class CreateAddedVideos < ActiveRecord::Migration
  def change
    create_table :added_videos do |t|
      t.references :video, index: true, foreign_key: true
      t.references :added_videos_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

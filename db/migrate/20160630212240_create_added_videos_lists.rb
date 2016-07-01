class CreateAddedVideosLists < ActiveRecord::Migration
  def change
    create_table :added_videos_lists do |t|
      t.integer :total
      t.references :add_videos_status, index: true, foreign_key: true
      t.references :competition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

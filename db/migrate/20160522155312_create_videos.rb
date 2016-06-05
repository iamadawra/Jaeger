class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :video_url
      t.string :poster_url
      t.boolean :is_in_competition
      t.integer :competition_id
      t.integer :uploader_id
      t.string :tags
      t.datetime :uploaded_at
      t.float :rating
      t.float :voting
      t.integer :rate_num
      t.integer :vote_num

      t.timestamps null: false
    end
  end
end

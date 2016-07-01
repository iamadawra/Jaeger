class CreateAddVideosStatuses < ActiveRecord::Migration
  def change
    create_table :add_videos_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

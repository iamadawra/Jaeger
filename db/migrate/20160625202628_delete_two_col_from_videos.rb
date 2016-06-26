class DeleteTwoColFromVideos < ActiveRecord::Migration
  def change
  	remove_column :videos, :is_in_competition, :competition_id
  end
end

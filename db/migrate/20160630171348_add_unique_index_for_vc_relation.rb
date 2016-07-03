class AddUniqueIndexForVcRelation < ActiveRecord::Migration
  def change
  	add_index :vc_relations, [:video_id, :competition_id], :unique => true
  end
end

class CreateVcRelations < ActiveRecord::Migration
  def change
    create_table :vc_relations do |t|
      t.integer :video_id
      t.integer :competition_id

      t.timestamps null: false
    end
  end
end

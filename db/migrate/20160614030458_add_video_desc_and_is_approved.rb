class AddVideoDescAndIsApproved < ActiveRecord::Migration
  def change
  	add_column :videos, :is_approved, :boolean
  	add_column :videos, :video_desc, :string
  end
end

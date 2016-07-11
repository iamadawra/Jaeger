class AddVideoApprovedToVcRelation < ActiveRecord::Migration
  def change
    add_column :vc_relations, :is_approved, :integer, :default => 0, :null => false
  end
end

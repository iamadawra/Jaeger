class ChangeVideoApproved < ActiveRecord::Migration
  def change
    change_column :videos, :is_approved, :integer, :default => 0, :null => false
  end
end

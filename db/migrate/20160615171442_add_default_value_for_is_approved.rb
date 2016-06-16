class AddDefaultValueForIsApproved < ActiveRecord::Migration
  def change
  	change_column_default :videos, :is_approved, 0
  end
end

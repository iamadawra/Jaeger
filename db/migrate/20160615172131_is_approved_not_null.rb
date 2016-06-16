class IsApprovedNotNull < ActiveRecord::Migration
  def change
  	change_column_null :videos, :is_approved, false
  end
end

class AddEndDateAndIsActiveToCompetition < ActiveRecord::Migration
  def change
  	add_column :competitions, :end_date, :date
  end
end

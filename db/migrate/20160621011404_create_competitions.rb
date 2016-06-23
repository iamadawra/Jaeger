class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.string :desc
      t.date :start_date
      t.integer :period
      t.integer :prize
      t.integer :prize_num
      t.string :poster

      t.timestamps null: false
    end
  end
end

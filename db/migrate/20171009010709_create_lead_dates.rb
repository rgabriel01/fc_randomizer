class CreateLeadDates < ActiveRecord::Migration
  def change
    create_table :lead_dates do |t|
      t.integer :lead_id
      t.date :first_date
      t.date :second_date
      t.date :third_date
      t.timestamps
    end
    add_index :lead_dates, :lead_id
  end
end

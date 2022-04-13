class CreateIncidences < ActiveRecord::Migration[5.2]
  def change
    create_table :incidences do |t|
      t.references :employee, foreign_key: true
      t.integer :incidence_type
      t.integer :concept
      t.date :start_date
      t.date :end_date
      t.float :amount

      t.timestamps
    end
  end
end

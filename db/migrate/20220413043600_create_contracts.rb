class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :employee, foreign_key: true
      t.float :gross_salary
      t.integer :payroll_type
      t.boolean :active

      t.timestamps
    end
  end
end

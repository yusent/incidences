class CreatePayrollInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_invoices do |t|
      t.references :employee, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :concept
      t.float :total

      t.timestamps
    end
  end
end

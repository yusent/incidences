class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :rfc
      t.date :date_registered
      t.string :imss_number

      t.timestamps
    end
  end
end

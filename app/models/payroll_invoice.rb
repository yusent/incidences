class PayrollInvoice < ApplicationRecord
  belongs_to :employee

  validates_presence_of :employee, :start_date, :end_date, :concept, :total
  validates_numericality_of :total, greater_than: 0
end

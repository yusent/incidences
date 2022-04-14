class PayrollInvoice < ApplicationRecord
  include PayrollInvoiceTotalCalculator

  belongs_to :employee

  validates_presence_of :employee, :start_date, :end_date, :concept
end

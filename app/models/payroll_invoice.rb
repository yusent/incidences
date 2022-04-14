class PayrollInvoice < ApplicationRecord
  include PayrollInvoiceTotalCalculator

  belongs_to :employee

  validates_presence_of :employee, :start_date, :end_date, :concept
  validates :start_date, not_after: :end_date
end

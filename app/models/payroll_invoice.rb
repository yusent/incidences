class PayrollInvoice < ApplicationRecord
  belongs_to :employee

  validates_numericality_of :total, greater_than: 0
end

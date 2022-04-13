class Contract < ApplicationRecord
  belongs_to :employee

  enum payroll_type: %i[weekly biweekly monthly]
end

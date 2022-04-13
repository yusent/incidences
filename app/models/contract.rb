class Contract < ApplicationRecord
  belongs_to :employee

  enum payroll_type: %i[weekly biweekly monthly]

  validates_numericality_of :gross_salary, greater_than: 0

  after_save :deactive_other_contracts_if_active

  def deactive_other_contracts_if_active
    self.class
      .where(employee: employee, active: true)
      .where.not(id: id)
      .update_all(active: false) if active?
  end
end

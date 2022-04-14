module PayrollInvoiceTotalCalculator
  extend ActiveSupport::Concern

  included do
    before_validation :calculate_total

    def calculate_total
      return unless employee&.active_contract

      incidences = employee.incidences.where(end_date: start_date..end_date)

      self.total = employee.active_contract
        .gross_salary.+(incidences.sum(&:amount_to_add))
        .round(2)
    end
  end
end

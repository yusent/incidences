FactoryBot.define do
  factory :contract do
    employee { nil }
    gross_salary { 1.5 }
    payroll_type { 1 }
    active { "" }
  end
end

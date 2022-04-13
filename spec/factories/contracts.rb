FactoryBot.define do
  factory :contract do
    association :employee
    gross_salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    payroll_type { %i[weekly biweekly monthly].sample }
    active { true }
  end
end

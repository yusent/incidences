FactoryBot.define do
  factory :payroll_invoice do
    association :employee
    start_date { 6.days.ago.to_date }
    end_date { Time.now.to_date }
    concept { Faker::Lorem.sentence }
    total { nil }
  end
end

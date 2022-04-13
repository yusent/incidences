FactoryBot.define do
  factory :payroll_invoice do
    employee { nil }
    start_date { "2022-04-13" }
    end_date { "2022-04-13" }
    concept { "MyText" }
    total { 1.5 }
  end
end

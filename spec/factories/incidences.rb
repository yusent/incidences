FactoryBot.define do
  factory :incidence do
    employee { nil }
    incidence_type { 1 }
    concept { 1 }
    start_date { "2022-04-13" }
    end_date { "2022-04-13" }
    amount { 1.5 }
  end
end

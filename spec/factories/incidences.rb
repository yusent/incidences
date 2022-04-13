FactoryBot.define do
  factory :incidence do
    association :employee
    incidence_type { %i[deductions perceptions].sample }
    concept { %i[illness absence delay vacation extrahours extraday].sample }
    start_date { rand(4..6).days.ago.to_date }
    end_date { rand(3).days.ago.to_date }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end

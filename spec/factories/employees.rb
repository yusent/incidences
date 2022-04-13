FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_registered { rand(5.days.ago..Time.now).to_date }
    imss_number { Faker::Number.decimal_part(digits: 11) }

    rfc do
      val = rand(3..4).times.map { ['&', *('A'..'Z')].sample }.join # e.g. XAXX
      val << rand(100.years.ago..18.years.ago).strftime("%y%m%d") # e.g. 841129
      val << 2.times.map { [*('A'..'Z'), *('1'..'9')].sample }.join # e.g. CI
      val << ['A', *('1'..'9')].sample # e.g. 9
    end
  end
end

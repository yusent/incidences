FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    date_registered { "2022-04-13" }
    imss_number { 11.times.map { rand(10).to_s }.join }

    rfc do
      val = rand(3..4).times.map { ['&', *('A'..'Z')].sample }.join # e.g. XAXX
      val << rand(100.years.ago..18.years.ago).strftime("%y%m%d") # e.g. 841129
      val << 2.times.map { [*('A'..'Z'), *('1'..'9')].sample }.join # e.g. CI
      val << ['A', *('1'..'9')].sample # e.g. 9
    end
  end
end

FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    rfc { "MyString" }
    date_registered { "2022-04-13" }
    imss_number { "MyString" }
  end
end

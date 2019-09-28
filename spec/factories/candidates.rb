FactoryBot.define do
  factory :candidate do
    election { nil }
    number { 1 }
    name { "MyString" }
  end
end

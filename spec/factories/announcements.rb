FactoryBot.define do
  factory :announcement do
    published_at { "2022-12-31 10:07:47" }
    announcement_type { "MyString" }
    name { "MyString" }
    description { "MyText" }
  end
end

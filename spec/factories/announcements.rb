# == Schema Information
#
# Table name: announcements
#
#  id                :uuid             not null, primary key
#  announcement_type :string
#  description       :text
#  name              :string
#  published_at      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :announcement do
    published_at { "2022-12-31 10:07:47" }
    announcement_type { "MyString" }
    name { "MyString" }
    description { "MyText" }
  end
end

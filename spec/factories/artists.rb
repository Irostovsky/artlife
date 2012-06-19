# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    title "MyString"
    country "MyString"
    biography "MyText"
    position 1
  end
end

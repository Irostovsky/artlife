# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :medium, :class => 'Media' do
    title "MyString"
    player_url "MyString"
    kind "MyString"
    position 1
  end
end

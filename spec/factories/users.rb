FactoryGirl.define do
  factory :user do
    sequence :email do |n|
        "test#{n}@mailinator.com"
      end
    password '123123'
    password_confirmation '123123'
  end

end  

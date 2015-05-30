FactoryGirl.define do
  
  factory :user do
    sequence(:email) { |n| "rubyrodd#{n}@supergre.en" }
    password "12345678"
    password_confirmation "12345678"
  end

end

FactoryGirl.define do
  
  factory :player do
    sequence(:coc_id, "a") { |n| "#RCQOJOJ#{n}" }
    level 84
    name "ponikz"
  end

end

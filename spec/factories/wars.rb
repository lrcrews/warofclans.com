FactoryGirl.define do
  
  factory :war do
    battles { [ FactoryGirl.build(:battle) ] }
    war_date 2.days.ago.to_date
  end

end

FactoryGirl.define do
  
  factory :war do
    battles { [ FactoryGirl.build(:battle) ] }
    blue_team FactoryGirl.build(:clan)
    red_team FactoryGirl.build(:clan)
    war_date 2.days.ago.to_date
  end

end

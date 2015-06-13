FactoryGirl.define do
  
  factory :clan_war do
    clan { FactoryGirl.build(:clan) }
    war { FactoryGirl.build(:war) }
    winner false
  end

end

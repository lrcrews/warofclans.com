FactoryGirl.define do
  
  factory :clan_war do
    clan { FactoryGirl.build(:clan) }
    player_count 15
    stars_earned 4
    war { FactoryGirl.build(:war) }
    winner false
  end

end

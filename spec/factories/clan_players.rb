FactoryGirl.define do
  
  factory :clan_player do  
    clan { FactoryGirl.build(:clan) }
    player { FactoryGirl.build(:player) }
    active true
  end

end

FactoryGirl.define do
  
  factory :clan do
    clan_type "Anyone can join"
    sequence(:id) { |n| n }
    sequence(:coc_id, "a") { |n| "#8JR8G8#{n}" }
    level 3
    name "New World 9"
    required_trophies 1700
    war_frequency "Once a week"
    wars_won 35
  end

end

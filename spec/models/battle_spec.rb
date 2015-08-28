require 'rails_helper'

RSpec.describe Battle do

  before :each do
    # make war
    @war = FactoryGirl.build(:war)
    clan_war1 = FactoryGirl.build(:clan_war, war: @war)
    clan_war2 = FactoryGirl.build(:clan_war, war: @war)
    @war.clan_wars = [ clan_war1, clan_war2 ]
    @war.save
    # not peace
    @battle = FactoryGirl.build(:battle)
    @battle.attacker = FactoryGirl.build(:player)
    @battle.defender = FactoryGirl.build(:player)
    @battle.war = @war
    @battle.save
  end

  after :each do
    @war.destroy
  end

  describe "after_create" do
    it "should update the attacks_won counter on the attacking Player" do
      attacker = FactoryGirl.create(:player)
      expect(attacker.attacks_won).to eq(0)
      
      battle1 = FactoryGirl.build(:battle, 
        destruction_percent: 44, 
        stars_awarded: 0, 
        war_stars_awarded: 0
      )
      battle1.attacker = attacker
      battle1.defender = FactoryGirl.build(:player)
      battle1.war = @war
      battle1.save
      expect(attacker.attacks_won).to eq(0)
      
      battle2 = FactoryGirl.build(:battle, 
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 2
      )
      battle2.attacker = attacker
      battle2.defender = FactoryGirl.build(:player)
      battle2.war = @war
      battle2.save
      expect(attacker.attacks_won).to eq(1)
    end

    it "should update the attacks_won_with_war_stars counter on the attacking Player" do
      attacker = FactoryGirl.create(:player)
      expect(attacker.attacks_won_with_war_stars).to eq(0)

      battle1 = FactoryGirl.build(:battle, 
        destruction_percent: 88, 
        stars_awarded: 1, 
        war_stars_awarded: 0
      )
      battle1.attacker = attacker
      battle1.defender = FactoryGirl.build(:player)
      battle1.war = @war
      battle1.save
      expect(attacker.attacks_won_with_war_stars).to eq(0)

      battle2 = FactoryGirl.build(:battle, 
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 2
      )
      battle2.attacker = attacker
      battle2.defender = FactoryGirl.build(:player)
      battle2.war = @war
      battle2.save
      expect(attacker.attacks_won_with_war_stars).to eq(1)
    end

    it "should update the defences_won_completely counter for the defending Player" do
      defender = FactoryGirl.create(:player)
      expect(defender.defences_won_completely).to eq(0)

      battle1 = FactoryGirl.build(:battle, 
        destruction_percent: 55, 
        stars_awarded: 1, 
        war_stars_awarded: 0
      )
      battle1.attacker = FactoryGirl.build(:player)
      battle1.defender = defender
      battle1.war = @war
      battle1.save
      expect(defender.defences_won_completely).to eq(0)

      battle2 = FactoryGirl.build(:battle, 
        destruction_percent: 49, 
        stars_awarded: 0, 
        war_stars_awarded: 0
      )
      battle2.attacker = FactoryGirl.build(:player)
      battle2.defender = defender
      battle2.war = @war
      battle2.save
      expect(defender.defences_won_completely).to eq(1)
    end

    it "should update the defences_won_war_stars_defended counter for the defending Player" do
      defender = FactoryGirl.create(:player)
      expect(defender.defences_won_war_stars_defended).to eq(0)

      battle1 = FactoryGirl.build(:battle, 
        destruction_percent: 55, 
        stars_awarded: 1, 
        war_stars_awarded: 1
      )
      battle1.attacker = FactoryGirl.build(:player)
      battle1.defender = defender
      battle1.war = @war
      battle1.save
      expect(defender.defences_won_war_stars_defended).to eq(0)

      battle2 = FactoryGirl.build(:battle, 
        destruction_percent: 88, 
        stars_awarded: 2, 
        war_stars_awarded: 0
      )
      battle2.attacker = FactoryGirl.build(:player)
      battle2.defender = defender
      battle2.war = @war
      battle2.save
      expect(defender.defences_won_war_stars_defended).to eq(1)

      battle3 = FactoryGirl.build(:battle, 
        destruction_percent: 49, 
        stars_awarded: 0, 
        war_stars_awarded: 0
      )
      battle3.attacker = FactoryGirl.build(:player)
      battle3.defender = defender
      battle3.war = @war
      battle3.save
      expect(defender.defences_won_war_stars_defended).to eq(2)
    end

    it "should update the war_stars_awarded counter on the attacker's clan's ClanWar instance" do
      clan_war = @war.clan_wars.first
      clan = clan_war.clan
      attacker = FactoryGirl.create(:player)
      clan_player = FactoryGirl.create(:clan_player, clan: clan, player: attacker, active: true)
      initial_war_stars_awarded = clan_war.war_stars_awarded

      battle1 = FactoryGirl.create(:battle, 
        attacker: attacker,
        defender: FactoryGirl.build(:player),
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 2,
        war: @war
      )

      expect(clan_war.war_stars_awarded).to eq(initial_war_stars_awarded + 2)
    end
  end

  describe "as_json" do
    it "should not return war if no options are given" do
      expect(@battle.as_json['war']).to eq(nil)
    end

    it "should return an attacker hash" do
      attacker = @battle.as_json['attacker']
      expect(attacker).to be_present
      expect(attacker.is_a?(Hash)).to be_truthy
    end

    it "should return an attacker_earned_stars_for_clan boolean" do
      expect(@battle.as_json.keys.include?('attacker_earned_stars_for_clan')).to be_truthy
    end

    it "should return an attacker_victorious boolean" do
      expect(@battle.as_json.keys.include?('attacker_victorious')).to be_truthy
    end

    it "should return a defender hash" do
      defender = @battle.as_json['defender']
      expect(defender).to be_present
      expect(defender.is_a?(Hash)).to be_truthy
    end

    it "should return a hash" do
      expect(@battle.as_json.is_a?(Hash)).to be_truthy
    end

    it "should return war as a hash if war is requested" do
      war = @battle.as_json(include_war: 'yes')['war']
      expect(war).to be_present
      expect(war.is_a?(Hash)).to be_truthy
    end
    
    it "should return created_at as YYYY-mm-dd" do
      expect(@battle.as_json['created_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end

    it "should return updated_at as YYYY-mm-dd" do
      expect(@battle.as_json['updated_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end
  end

  describe "before_create" do
    it "should set the coc ids of the attacker and defender" do
      # make war
      war = FactoryGirl.build(:war)
      clan_war1 = FactoryGirl.build(:clan_war, war: @war)
      clan_war2 = FactoryGirl.build(:clan_war, war: @war)
      war.clan_wars = [ clan_war1, clan_war2 ]
      war.save
      # battle it out
      battle = FactoryGirl.build(:battle)
      attacker = FactoryGirl.create(:player)
      clan_attacker = FactoryGirl.create(:clan_player, clan: clan_war1.clan, player: attacker, active: true)
      battle.attacker = attacker
      defender = FactoryGirl.create(:player)
      clan_defender = FactoryGirl.create(:clan_player, clan: clan_war2.clan, player: defender, active: true)
      battle.defender = defender
      battle.war = war
      
      expect(battle.attacker_clan_coc_id.nil?).to be_truthy
      expect(battle.defender_clan_coc_id.nil?).to be_truthy
      
      battle.save
      expect(battle.attacker_clan_coc_id).to eq(clan_war1.clan.coc_id)
      expect(battle.defender_clan_coc_id).to eq(clan_war2.clan.coc_id)

      war.destroy
    end
  end

  describe "attacker" do
    it "should be present" do
      @battle.attacker = nil
      expect(@battle).to be_invalid

      @battle.attacker = FactoryGirl.build(:player)
      expect(@battle).to be_valid
    end
  end

  describe "attacker_earned_stars_for_clan?" do
    it "should be false if no stars were earned for the clan" do
      @battle.stars_awarded = 0
      @battle.war_stars_awarded = 0
      expect(@battle.attacker_earned_stars_for_clan?).to be_falsey
    end

    it "should be true if any stars were earned for the clan" do
      @battle.stars_awarded = 3
      @battle.war_stars_awarded = 1
      expect(@battle.attacker_earned_stars_for_clan?).to be_truthy

      @battle.war_stars_awarded = 2
      expect(@battle.attacker_earned_stars_for_clan?).to be_truthy

      @battle.war_stars_awarded = 3
      expect(@battle.attacker_earned_stars_for_clan?).to be_truthy
    end
  end

  describe "attacker_rank" do
    it "should be an integer from 1 to 50" do
      @battle.attacker_rank = nil
      expect(@battle).to be_invalid

      @battle.attacker_rank = 4.2
      expect(@battle).to be_invalid

      @battle.attacker_rank = "Punisher-esque"
      expect(@battle).to be_invalid

      @battle.attacker_rank = 0
      expect(@battle).to be_invalid

      (1..50).each do |i|
        @battle.attacker_rank = i
        expect(@battle).to be_valid
      end

      @battle.attacker_rank = 51
      expect(@battle).to be_invalid
    end
  end

  describe "attacker_victorious?" do
    it "should be false if no stars were earned" do
      @battle.stars_awarded = 0
      @battle.war_stars_awarded = 0
      expect(@battle.attacker_victorious?).to be_falsey
    end

    it "should be true if any stars were earned" do
      @battle.war_stars_awarded = 0
      @battle.stars_awarded = 1
      expect(@battle.attacker_victorious?).to be_truthy

      @battle.stars_awarded = 2
      expect(@battle.attacker_victorious?).to be_truthy

      @battle.stars_awarded = 3
      expect(@battle.attacker_victorious?).to be_truthy
    end
  end

  describe "defended_completely?" do
    it "should return false if stars were awarded to the attacker" do
      @battle.destruction_percent = 55
      @battle.stars_awarded = 1
      @battle.war_stars_awarded = 1
      expect(@battle.defended_completely?).to be_falsey
    end

    it "should return true if no stars were awarded to the attacker" do
      @battle.destruction_percent = 0
      @battle.stars_awarded = 0
      @battle.war_stars_awarded = 0
      expect(@battle.defended_completely?).to be_truthy
    end
  end

  describe "defended_war_stars?" do
    it "should return false if war stars were awarded to the attacker" do
      @battle.destruction_percent = 55
      @battle.stars_awarded = 1
      @battle.war_stars_awarded = 1
      expect(@battle.defended_war_stars?).to be_falsey
    end

    it "should return true if no war stars were awarded to the attacker" do
      @battle.destruction_percent = 55
      @battle.stars_awarded = 1
      @battle.war_stars_awarded = 0
      expect(@battle.defended_war_stars?).to be_truthy
    end
  end

  describe "defender" do
    it "should be present" do
      @battle.defender = nil
      expect(@battle).to be_invalid

      @battle.defender = FactoryGirl.build(:player)
      expect(@battle).to be_valid
    end
  end

  describe "defender_rank" do
    it "should be an integer from 1 to 50" do
      @battle.defender_rank = nil
      expect(@battle).to be_invalid

      @battle.defender_rank = 10.5
      expect(@battle).to be_invalid

      @battle.defender_rank = "Aegis-like"
      expect(@battle).to be_invalid

      @battle.defender_rank = 0
      expect(@battle).to be_invalid

      (1..50).each do |i|
        @battle.defender_rank = i
        expect(@battle).to be_valid
      end

      @battle.defender_rank = 51
      expect(@battle).to be_invalid
    end
  end

  describe "destruction_percent" do
    it "should be an integer between 0 and 100" do
      @battle.stars_awarded = 2
      @battle.war_stars_awarded = 0

      @battle.destruction_percent = nil
      expect(@battle).to be_invalid

      @battle.destruction_percent = 55.55
      expect(@battle).to be_invalid

      @battle.destruction_percent = "thermo-nuclear"
      expect(@battle).to be_invalid

      @battle.destruction_percent = -1
      expect(@battle).to be_invalid

      (0..99).each do |i|
        @battle.destruction_percent = i
        expect(@battle).to be_valid
      end

      @battle.stars_awarded = 3
      @battle.destruction_percent = 100
      expect(@battle).to be_valid

      @battle.destruction_percent = 101
      expect(@battle).to be_invalid
    end
  end

  describe "minutes_left_in_war" do
    it "should be an integer between 0 and 1440" do
      @battle.minutes_left_in_war = nil
      expect(@battle).to be_invalid

      @battle.minutes_left_in_war = 1400.20
      expect(@battle).to be_invalid

      @battle.minutes_left_in_war = "360 shy of tequila"
      expect(@battle).to be_invalid

      @battle.minutes_left_in_war = -1
      expect(@battle).to be_invalid

      (0..1440).each do |i|
        @battle.minutes_left_in_war = i
        expect(@battle).to be_valid
      end

      @battle.minutes_left_in_war = 1441
      expect(@battle).to be_invalid
    end
  end

  describe "stars_awarded" do
    it "should be 0, 1, 2, or 3" do
      @battle.destruction_percent = 99
      @battle.war_stars_awarded = 0

      @battle.stars_awarded = nil
      expect(@battle).to be_invalid

      @battle.stars_awarded = 1.5
      expect(@battle).to be_invalid

      @battle.stars_awarded = "battle toads"
      expect(@battle).to be_invalid

      @battle.stars_awarded = -1
      expect(@battle).to be_invalid

      (0..2).each do |i|
        @battle.stars_awarded = i
        expect(@battle).to be_valid
      end

      @battle.destruction_percent = 100
      @battle.stars_awarded = 3
      expect(@battle).to be_valid

      @battle.stars_awarded = 4
      expect(@battle).to be_invalid
    end

    it "should be 3 if destruction_percent is 100" do
      @battle.destruction_percent = 100
      @battle.stars_awarded = 2
      expect(@battle).to be_invalid

      @battle.stars_awarded = 3
      expect(@battle).to be_valid
    end

    it "should not be 3 if destruction_percent is less than 100" do
      @battle.war_stars_awarded = 0

      @battle.destruction_percent = 99
      @battle.stars_awarded = 3
      expect(@battle).to be_invalid

      @battle.stars_awarded = 2
      expect(@battle).to be_valid
    end
  end

  describe "war_stars_awarded" do
    it "should be 0, 1, 2, or 3" do
      @battle.war_stars_awarded = nil
      expect(@battle).to be_invalid

      @battle.war_stars_awarded = 1.5
      expect(@battle).to be_invalid

      @battle.war_stars_awarded = "combat basketball"
      expect(@battle).to be_invalid

      @battle.war_stars_awarded = -1
      expect(@battle).to be_invalid

      @battle.destruction_percent = 99
      (0..2).each do |i|
        @battle.stars_awarded = i
        @battle.war_stars_awarded = i
        expect(@battle).to be_valid
      end

      @battle.destruction_percent = 100
      @battle.stars_awarded = 3
      @battle.war_stars_awarded = 3
      expect(@battle).to be_valid

      @battle.war_stars_awarded = 4
      expect(@battle).to be_invalid
    end

    it "should not be more than stars_awarded" do
      @battle.stars_awarded = 3
      @battle.war_stars_awarded = 3
      expect(@battle).to be_valid

      @battle.stars_awarded = 3
      @battle.war_stars_awarded = 2
      expect(@battle).to be_valid

      @battle.stars_awarded = 2
      @battle.war_stars_awarded = 3
      expect(@battle).to be_invalid
    end
  end

  describe "war" do
    it "should be present" do
      @battle.war = nil
      expect(@battle).to be_invalid

      @battle.war = FactoryGirl.build(:war)
      expect(@battle).to be_valid
    end
  end

end

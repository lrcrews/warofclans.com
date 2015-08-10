require 'rails_helper'

RSpec.describe Player do  

  before :each do
    @player = FactoryGirl.create(:player)
  end

  after :each do
    @player.destroy
  end

  it_should_behave_like("coc identifiable", FactoryGirl.build(:player))

  it_should_behave_like(
    "single attribute validateable", 
    Player, 
    :name, 
    nil, 
    ["can't be blank"]
  )

  describe "active_clan" do
    it "should be the clan of the most recent battle" do
      pending("got sidetracked by something dumb I did.")
      this_should_not_get_executed
    end
  end

  describe "as_json" do 
    it "should not return attacks if no options are given" do
      expect(@player.as_json.keys.include?('attacks')).to be_falsey
    end

    it "should not return clans if no options are given" do
      expect(@player.as_json.keys.include?('clans')).to be_falsey
    end

    it "should not return defences if no options are given" do
      expect(@player.as_json.keys.include?('defences')).to be_falsey
    end

    it "should return a hash" do
      expect(@player.as_json.is_a?(Hash)).to be_truthy
    end

    it "should return attacks if they are requested" do
      expect(@player.as_json(include_all: 'yes').keys.include?('attacks')).to be_truthy
      expect(@player.as_json(include_attacks: 'yes').keys.include?('attacks')).to be_truthy
      expect(@player.as_json(include_battles: 'yes').keys.include?('attacks')).to be_truthy
    end

    it "should include clans if they are requested" do
      expect(@player.as_json(include_all: 'yes').keys.include?('clans')).to be_truthy
      expect(@player.as_json(include_clans: 'yes').keys.include?('clans')).to be_truthy
    end

    it "should return created_at as YYYY-mm-dd" do
      expect(@player.as_json['created_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end

    it "should return defences if they are requested" do
      expect(@player.as_json(include_all: 'yes').keys.include?('defences')).to be_truthy
      expect(@player.as_json(include_battles: 'yes').keys.include?('defences')).to be_truthy
      expect(@player.as_json(include_defences: 'yes').keys.include?('defences')).to be_truthy
    end

    it "should return total_attacks as a number greater than or equal to 0" do
      expect(@player.as_json['total_attacks']).to be >= 0
    end

    it "should return total_defences as a number greater than or equal to 0" do
      expect(@player.as_json['total_defences']).to be >= 0
    end

    it "should return updated_at as YYYY-mm-dd" do
      expect(@player.as_json['updated_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end
  end

  describe "attacks" do
    it "should pull all attacks (if any) regardless of war" do
      player1 = FactoryGirl.build(:player)
      player1.attacks = []
      player1.save
      expect(player1).to be_valid

      expect(player1.attacks.count).to eq(0)

      player2 = FactoryGirl.create(:player)
      expect(player2).to be_persisted

      clan_war1 = FactoryGirl.create(:clan_war)
      expect(clan_war1).to be_persisted

      war1 = clan_war1.war
      
      battle1 = FactoryGirl.build(:battle, war: war1)
      battle1.attacker = player1
      battle1.defender = player2
      battle1.save
      expect(player1.attacks.count).to eq(1)

      battle2 = FactoryGirl.build(:battle, war: war1)
      battle2.attacker = player2
      battle2.defender = player1
      battle2.save
      expect(player1.attacks.count).to eq(1)

      clan_war2 = FactoryGirl.create(:clan_war)
      expect(clan_war2).to be_persisted

      war2 = clan_war2.war
      
      battle3 = FactoryGirl.build(:battle, war: war2)
      battle3.attacker = player1
      battle3.defender = player2
      battle3.save
      expect(player1.attacks.count).to eq(2)

      war2.destroy
      war1.destroy
      player2.destroy
      player1.destroy
    end
  end

  describe "attacks_won" do
    
    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.attacks_won).to eq(0)
    end

    it "should increase when an attack is won" do
      expect(@attacker.attacks.count).to eq(0)
      expect(@attacker.attacks_won).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 3,
        war: @war
      )

      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won).to eq(1)
    end

    it "should not increase when an attack is lost" do
      expect(@attacker.attacks.count).to eq(0)
      expect(@attacker.attacks_won).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won).to eq(0)
    end
  end

  describe "attacks_won_with_war_stars" do
    
    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.attacks_won_with_war_stars).to eq(0)
    end

    it "should increase when an attack is won" do
      expect(@attacker.attacks.count).to eq(0)
      expect(@attacker.attacks_won_with_war_stars).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 3,
        war: @war
      )

      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won_with_war_stars).to eq(1)
    end

    it "should not increase when an attack is lost" do
      expect(@attacker.attacks.count).to eq(0)
      expect(@attacker.attacks_won_with_war_stars).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won_with_war_stars).to eq(0)
    end

    it "should not increase when an attack is won, but no stars were earned for the player's clan" do
      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won_with_war_stars).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 88, 
        stars_awarded: 2, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.attacks.count).to eq(1)
      expect(@attacker.attacks_won_with_war_stars).to eq(0)
    end
  end

  describe "defences" do
    it "should pull all defences (if any) regardless of war" do
      player1 = FactoryGirl.build(:player)
      player1.defences = []
      player1.save
      expect(player1).to be_valid

      expect(player1.defences.count).to eq(0)

      player2 = FactoryGirl.create(:player)
      expect(player2).to be_persisted

      clan_war1 = FactoryGirl.create(:clan_war)
      expect(clan_war1).to be_persisted

      war1 = clan_war1.war

      battle1 = FactoryGirl.build(:battle, war: war1)
      battle1.attacker = player2
      battle1.defender = player1
      battle1.save
      expect(player1.defences.count).to eq(1)

      battle2 = FactoryGirl.build(:battle, war: war1)
      battle2.attacker = player1
      battle2.defender = player2
      battle2.save
      expect(player1.defences.count).to eq(1)

      clan_war2 = FactoryGirl.create(:clan_war)
      expect(clan_war2).to be_persisted

      war2 = clan_war2.war

      battle3 = FactoryGirl.build(:battle, war: war2)
      battle3.attacker = player2
      battle3.defender = player1
      battle3.save
      expect(player1.defences.count).to eq(2)

      war2.destroy
      war1.destroy
      player2.destroy
      player1.destroy
    end
  end

  describe "defences_won_completely" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.defences_won_completely).to eq(0)
    end

    it "should increase when a defense is won" do
      expect(@defender.defences.count).to eq(0)
      expect(@defender.defences_won_completely).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.defences.count).to eq(1)
      expect(@defender.defences_won_completely).to eq(1)
    end

    it "should not increase when a defence is lost" do
      expect(@defender.defences.count).to eq(0)
      expect(@defender.defences_won_completely).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 53, 
        stars_awarded: 2, 
        war_stars_awarded: 2,
        war: @war
      )

      expect(@defender.defences.count).to eq(1)
      expect(@defender.defences_won_completely).to eq(0)
    end
  end

  describe "defences_won_war_stars_defended" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.defences_won_war_stars_defended).to eq(0)
    end

    it "should increase when a defense is won" do
      expect(@defender.defences.count).to eq(0)
      expect(@defender.defences_won_war_stars_defended).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.defences.count).to eq(1)
      expect(@defender.defences_won_war_stars_defended).to eq(1)
    end

    it "should increase when a defense is lost, but the stars earned by the attacker was 0" do
      expect(@defender.defences.count).to eq(0)
      expect(@defender.defences_won_war_stars_defended).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 88, 
        stars_awarded: 2, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.defences.count).to eq(1)
      expect(@defender.defences_won_war_stars_defended).to eq(1)
    end

    it "should not increase when a defence is lost" do
      expect(@defender.defences.count).to eq(0)
      expect(@defender.defences_won_war_stars_defended).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 53, 
        stars_awarded: 2, 
        war_stars_awarded: 2,
        war: @war
      )

      expect(@defender.defences.count).to eq(1)
      expect(@defender.defences_won_war_stars_defended).to eq(0)
    end
  end

  describe "for_clan" do
    it "should load all players for a given clan" do
      clan1 = FactoryGirl.create(:clan)
      expect(clan1).to be_persisted
      expect(Player.for_clan(clan1).count).to eq(0)

      clan2 = FactoryGirl.create(:clan)
      expect(clan2).to be_persisted
      expect(Player.for_clan(clan2).count).to eq(0)

      clan1_player1 = FactoryGirl.create(:clan_player, clan: clan1, player: @player, active: true)
      expect(Player.for_clan(clan1).count).to eq(1)

      player2 = FactoryGirl.create(:player)
      expect(player2).to be_persisted

      clan1_player2 = FactoryGirl.create(:clan_player, clan: clan1, player: player2, active: false)
      expect(Player.for_clan(clan1).count).to eq(2)

      clan2_player2 = FactoryGirl.create(:clan_player, clan: clan2, player: player2, active: false)
      expect(Player.for_clan(clan1).count).to eq(2)
      expect(Player.for_clan(clan2).count).to eq(1)
    end
  end

  describe "level" do
    it "should be present" do
      @player.level = nil
      expect(@player).to be_invalid
    end

    it "should be a number between one and 999" do
      @player.level = "foo"
      expect(@player).to be_invalid

      @player.level = "42foo"
      expect(@player).to be_invalid

      @player.level = -42
      expect(@player).to be_invalid

      @player.level = 0
      expect(@player).to be_invalid

      @player.level = 1
      expect(@player).to be_valid

      @player.level = 4.20
      expect(@player).to be_invalid

      @player.level = 999
      expect(@player).to be_valid

      @player.level = 1000
      expect(@player).to be_invalid
    end
  end

  describe "name" do
    it "should be present" do
      @player.name = nil
      expect(@player).to be_invalid
    end
  end

  describe "stars" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.stars).to eq(0)
    end

    it "should increase when an attack is won" do
      expect(@attacker.stars.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.stars.count).to eq(3)
    end

    it "should not increase when an attack is lost" do
      expect(@attacker.stars.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.stars.count).to eq(0)
    end
  end

  describe "stars_lost" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.stars_lost).to eq(0)
    end

    it "should increase when a defense is lost" do
      expect(@defender.stars_lost.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.stars_lost.count).to eq(3)
    end

    it "should not increase when a defense is won" do
      expect(@defender.stars_lost.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.stars_lost.count).to eq(0)
    end
  end

  describe "war_stars" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.war_stars).to eq(0)
    end

    it "should increase when an attack is won" do
      expect(@attacker.war_stars.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 2,
        war: @war
      )

      expect(@attacker.war_stars.count).to eq(2)
    end

    it "should not increase when an attack is lost" do
      expect(@attacker.war_stars.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.war_stars.count).to eq(0)
    end

    it "should not increase when an attack is won, but it didn't gain any stars for the players's clan" do
      expect(@attacker.war_stars.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 98, 
        stars_awarded: 2, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@attacker.war_stars.count).to eq(0)
    end
  end

  describe "war_stars_lost" do

    before :each do
      @attacker = FactoryGirl.create(:player)
      @defender = FactoryGirl.create(:player)
      @war = FactoryGirl.create(:clan_war).war
    end

    after :each do
      @war.destroy
      @attacker.destroy
      @defender.destroy
    end

    it "should default to 0" do
      expect(Player.new.war_stars_lost).to eq(0)
    end

    it "should increase when a defense is lost" do
      expect(@defender.war_stars_lost.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 100, 
        stars_awarded: 3, 
        war_stars_awarded: 2,
        war: @war
      )

      expect(@defender.war_stars_lost.count).to eq(2)
    end

    it "should not increase when a defense is lost, but the attacker gained no war stars for their clan" do
      expect(@defender.war_stars_lost.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 98, 
        stars_awarded: 2, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.war_stars_lost.count).to eq(0)
    end

    it "should not increase when a defense is won" do
      expect(@defender.war_stars_lost.count).to eq(0)

      FactoryGirl.create(:battle, 
        attacker: @attacker,
        defender: @defender,
        destruction_percent: 42, 
        stars_awarded: 0, 
        war_stars_awarded: 0,
        war: @war
      )

      expect(@defender.war_stars_lost.count).to eq(0)
    end
  end

end

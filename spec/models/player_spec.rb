require 'rails_helper'

RSpec.describe Player do
  
  before :each do
    @player = FactoryGirl.build(:player)
  end

  specify { expect(@player).to be_valid }

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
    end
  end

  describe "for_clan" do
    it "should load all players for a given clan" do
      expect(Player.all.count).to eq(0)

      clan1 = FactoryGirl.create(:clan)
      expect(clan1).to be_persisted
      expect(Player.for_clan(clan1).count).to eq(0)

      clan2 = FactoryGirl.create(:clan)
      expect(clan2).to be_persisted
      expect(Player.for_clan(clan2).count).to eq(0)

      player1 = FactoryGirl.create(:player)
      expect(player1).to be_persisted

      clan1_player1 = FactoryGirl.create(:clan_player, clan: clan1, player: player1, active: true)
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

end

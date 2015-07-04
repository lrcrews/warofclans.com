require 'rails_helper'

RSpec.describe Clan do
  
  before :each do
    @clan = FactoryGirl.build(:clan)
    @clan.clan_wars << FactoryGirl.build(:clan_war, clan: @clan)
  end

  specify { expect(@clan).to be_valid }

  it_should_behave_like("coc identifiable", FactoryGirl.build(:clan))

  it_should_behave_like(
    "single attribute validateable", 
    Clan, 
    :name, 
    nil, 
    ["can't be blank"]
  )

  describe "active_players" do
    it "should only return players that are marked as active" do
      clan = @clan.dup
      clan.save
      expect(clan).to be_persisted

      player1 = FactoryGirl.create(:player)
      expect(player1).to be_persisted

      clan_player1 = FactoryGirl.create(:clan_player, clan: clan, player: player1, active: true)
      expect(clan.players.count).to equal(1)
      expect(clan.active_players.count).to equal(1)

      player2 = FactoryGirl.create(:player)
      expect(player2).to be_persisted

      clan_player2 = FactoryGirl.create(:clan_player, clan: clan, player: player2, active: false)
      expect(clan.players.count).to equal(2)
      expect(clan.active_players.count).to equal(1)
    end
  end

  describe "clan_location" do
    # TODO:
    # this!  in version 1.x.  That's a long fucking list and
    # my hands just aren't that idle.
    it "fuck that, too far" do
      pending("don't forget to bring a towel.")
      this_should_not_get_executed
    end
  end

  describe "clan_type" do
    it "should be present" do
      @clan.clan_type = nil
      expect(@clan).to be_invalid
    end

    it "should be in the list of Clan::CLAN_TYPES" do
      Clan::CLAN_TYPES.each do |clan_type|
        @clan.clan_type = clan_type
        expect(@clan).to be_valid
      end

      @clan.clan_type = "Kingdom of the Crystal Skull"
      expect(@clan).to be_invalid
    end
  end

  describe "level" do
    it "should be present" do
      @clan.level = nil
      expect(@clan).to be_invalid
    end

    it "should be defaulted to 1" do
      clan2 = Clan.new
      expect(clan2.level).to equal(1)
    end

    it "should be a number between one and 10" do
      @clan.level = 0
      expect(@clan).to be_invalid

      (1..10).each do |i|
        @clan.level = i
        expect(@clan).to be_valid
      end

      @clan.level = 11
      expect(@clan).to be_invalid
    end
  end

  describe "name" do
    it "should be present" do
      @clan.name = nil
      expect(@clan).to be_invalid
    end
  end

  describe "required_trophies" do
    it "should be present" do
      @clan.required_trophies = nil
      expect(@clan).to be_invalid
    end

    it "should be defaulted to 0" do
      clan2 = Clan.new
      expect(clan2.required_trophies).to equal(0)
    end

    it "shouldn't be negative" do
      @clan.required_trophies = -1
      expect(@clan).to be_invalid

      @clan.required_trophies = 867.5309
      expect(@clan).to be_invalid

      @clan.required_trophies = 1337
      expect(@clan).to be_valid
    end
  end

  describe "war_frequency" do
    it "should be present" do
      @clan.war_frequency = nil
      expect(@clan).to be_invalid
    end

    it "should be in the list of Clan::WAR_FREQUENCIES" do
      Clan::WAR_FREQUENCIES.each do |war_frequency|
        @clan.war_frequency = war_frequency
        expect(@clan).to be_valid
      end

      @clan.war_frequency = "On full moons that aren't blue"
      expect(@clan).to be_invalid
    end
  end

  describe "wars_won" do
    it "should be defaulted to 0" do
      clan2 = Clan.new
      expect(clan2.wars_won).to equal(0)
    end

    it "shouldn't be less than 0" do
      @clan.wars_won = -1
      expect(@clan).to be_invalid

      @clan.wars_won = 42
      expect(@clan).to be_valid # Don't Panic! ... this site will keep track of wars lost too.
    end

    it "should be an integer" do
      @clan.wars_won = 92.7 # The Beat
      expect(@clan).to be_invalid # Jams
    end

    it "should update itself when lower than associated wars marked won" do
      clan2 = Clan.new
      clan2.coc_id = "#HIF00842"
      clan2.name = @clan.name
      clan2.war_frequency = @clan.war_frequency
      clan2.save
      expect(clan2.wars_won).to equal(0)

      3.times do 
        clan2.clan_wars << FactoryGirl.build(:clan_war, clan: clan2, war: FactoryGirl.build(:war), winner: true)
      end
      clan2.save
      expect(clan2.wars_won).to equal(3)

      clan2.wars_won = 42
      9.times do 
        clan2.clan_wars << FactoryGirl.build(:clan_war, clan: clan2, war: FactoryGirl.build(:war), winner: true)
      end
      clan2.save
      expect(clan2.wars_won).to equal(42)
    end
  end

end

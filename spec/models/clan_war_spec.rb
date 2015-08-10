require 'rails_helper'

RSpec.describe ClanWar do
  
  before :each do
    @clan_war = FactoryGirl.build(:clan_war)
  end

  specify { expect(@clan_war).to be_valid }

  describe "player_count" do
    it "should be a multiple of 5 between 5 and 50 inclusive" do
      @clan_war.player_count = -5
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 0
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 5
      expect(@clan_war).to be_valid

      @clan_war.player_count = 6
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 7
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 8
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 9
      expect(@clan_war).to be_invalid

      @clan_war.player_count = 10
      expect(@clan_war).to be_valid

      @clan_war.player_count = 15
      expect(@clan_war).to be_valid

      @clan_war.player_count = 20
      expect(@clan_war).to be_valid

      @clan_war.player_count = 25
      expect(@clan_war).to be_valid

      @clan_war.player_count = 30
      expect(@clan_war).to be_valid

      @clan_war.player_count = 35
      expect(@clan_war).to be_valid

      @clan_war.player_count = 40
      expect(@clan_war).to be_valid

      @clan_war.player_count = 45
      expect(@clan_war).to be_valid

      @clan_war.player_count = 50
      expect(@clan_war).to be_valid

      @clan_war.player_count = 55
      expect(@clan_war).to be_invalid
    end
  end

  describe "war_stars_awarded" do
    it "should not be negative" do
      @clan_war.war_stars_awarded = -1
      expect(@clan_war).to be_invalid

      @clan_war.war_stars_awarded = 0
      expect(@clan_war).to be_valid

      @clan_war.war_stars_awarded = 1
      expect(@clan_war).to be_valid
    end

    it "should not be more than 3 times the player_count" do
      @clan_war.player_count = 10
      @clan_war.war_stars_awarded = 33
      expect(@clan_war).to be_invalid
      
      @clan_war.war_stars_awarded = 30
      expect(@clan_war).to be_valid

      @clan_war.player_count = 5
      expect(@clan_war).to be_invalid

      @clan_war.war_stars_awarded = 14
      expect(@clan_war).to be_valid

      @clan_war.player_count = 50
      expect(@clan_war).to be_valid

      @clan_war.war_stars_awarded = 150
      expect(@clan_war).to be_valid

      @clan_war.war_stars_awarded = 151
      expect(@clan_war).to be_invalid
    end
  end

end

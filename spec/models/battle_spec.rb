require 'rails_helper'

RSpec.describe Battle do
  
  before(:each) do
    @battle = FactoryGirl.build(:battle)
    @battle.attacker = FactoryGirl.build(:player)
    @battle.defender = FactoryGirl.build(:player)
    @battle.war = FactoryGirl.build(:war)
  end

  specify { expect(@battle).to be_valid }

  describe "attacker" do
    it "should be present" do
      @battle.attacker = nil
      expect(@battle).to be_invalid

      @battle.attacker = FactoryGirl.build(:player)
      expect(@battle).to be_valid
    end
  end

  describe "attacker_rank" do
    it "should be an integer from 1 to 50" do
      @battle.attacker_rank = nil
      expect(@battle).to be_invalid

      @battle.attacker_rank = 4.2
      expect(@battler).to be_invalid

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
      expect(@battler).to be_invalid

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
      @battle.destruction_percent = nil
      expect(@battle).to be_invalid

      @battle.destruction_percent = 55.55
      expect(@battle).to be_invalid

      @battle.destruction_percent = "thermo-nuclear"
      expect(@battle).to be_invalid

      @battle.destruction_percent = -1
      expect(@battle).to be_invalid

      (0..100).each do |i|
        @battle.destruction_percent = i
        expect(@battle).to be_valid
      end

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
      @battle.destruction_percent = 99
      @battle.stars_awarded = 3
      expect(@battle).to be_invalid

      @battle.stars_awarded = 2
      expect(@battle).to be_valid
    end
  end

  describe "stars_earned" do
    it "should be 0, 1, 2, or 3" do
      @battle.stars_awarded = 3

      @battle.stars_earned = nil
      expect(@battle).to be_invalid

      @battle.stars_earned = 1.5
      expect(@battle).to be_invalid

      @battle.stars_earned = "combat basketball"
      expect(@battle).to be_invalid

      @battle.stars_earned = -1
      expect(@battle).to be_invalid

      (0..3).each do |i|
        @battle.stars_earned = i
        expect(@battle).to be_valid
      end

      @battle.stars_earned = 4
      expect(@battle).to be_invalid
    end

    it "should not be more than stars_awarded" do
      @battle.stars_awarded = 3
      @battle.stars_earned = 3
      expect(@battle).to be_valid

      @battle.stars_awarded = 3
      @battle.stars_earned = 2
      expect(@battle).to be_valid

      @battle.stars_awarded = 2
      @battle.stars_earned = 3
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

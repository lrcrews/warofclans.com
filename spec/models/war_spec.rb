require 'rails_helper'

RSpec.describe War, type: :model do

  before :each do
    @war = FactoryGirl.build(:war)
    clan_war1 = FactoryGirl.build(:clan_war, war: @war)
    clan_war2 = FactoryGirl.build(:clan_war, war: @war)
    @war.clan_wars = [ clan_war1, clan_war2 ]
    @war.save
  end

  after :each do
    @war.delete
  end

  describe "clans" do
    it "should be exactly two clans per war" do
      expect(@war.clans.count).to equal(2)

      @war.clan_wars = [ FactoryGirl.build(:clan_war, war: @war) ]
      expect(@war).to be_invalid
    end

    it "should have zero or one winning clan" do
      winning_clan = FactoryGirl.build(:clan)
      winning_clan_war = FactoryGirl.build(:clan_war, clan: winning_clan, war: @war, winner: true)
      losing_clan = FactoryGirl.build(:clan)
      losing_clan_war = FactoryGirl.build(:clan_war, clan: losing_clan, war: @war, winner: false)

      @war.clan_wars = [ winning_clan_war, losing_clan_war ]
      expect(@war).to be_valid

      losing_clan2 = FactoryGirl.build(:clan)
      losing_clan_war2 = FactoryGirl.build(:clan_war, clan: losing_clan2, war: @war, winner: false)
      @war.clan_wars = [ losing_clan_war, losing_clan_war2]
      expect(@war).to be_valid

      winning_clan2 = FactoryGirl.build(:clan)
      winning_clan_war2 = FactoryGirl.build(:clan_war, clan: winning_clan2, war: @war, winner: true)
      @war.clan_wars = [ winning_clan_war, winning_clan_war2 ]
      expect(@war).to be_invalid
    end
  end

  describe "war_date" do
    it "should be present" do
      @war.war_date = nil
      expect(@war).to be_invalid
    end

    it "shouldn't be in the future" do
      @war.war_date = 1.day.ago.to_date
      expect(@war).to be_valid

      @war.war_date = Date.today
      expect(@war).to be_valid

      @war.war_date = 1.day.from_now.to_date
      expect(@war).to be_invalid
    end
  end

  describe "winning_clan?" do
    it "should return false for both clans if there's a tie" do
      @war.clan_wars.each do |clan_war|
        clan_war.winner = false
        expect(clan_war.winner).to be_falsey
        expect(@war.winning_clan?(clan_war.clan)).to be_falsey
      end
    end

    it "should return true for the winning clan" do
      clan_war = @war.clan_wars.first
      clan_war.winner = true
      clan_war.save
      expect(@war.winning_clan?(clan_war.clan)).to be_truthy
    end

    it "should return false for a winning clan not in the war" do
      clan_war_of_a_different_war = FactoryGirl.build(
        :clan_war, 
        clan: FactoryGirl.build(:clan), 
        war: FactoryGirl.build(:war),
        winner: true)
      expect(@war.winning_clan?(clan_war_of_a_different_war.clan)).to be_falsey
    end
  end

end

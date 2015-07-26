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
    @war.destroy
  end

  describe "as_json" do
    it "should not return battles if no options are given" do
      expect(@war.as_json['battles']).to eq(nil)
    end

    it "should not return clans if no options are given" do
      expect(@war.as_json['clans']).to eq(nil)
    end

    it "should return a hash" do
      expect(@war.as_json.is_a?(Hash)).to be_truthy
    end

    it "should return battle_count (a derived value)" do
      expect(@war.as_json['battle_count']).to be_present
    end

    it "should return battles as an array if battles are requested" do
      battle = FactoryGirl.build(:battle)
      battle.attacker = FactoryGirl.build(:player)
      battle.defender = FactoryGirl.build(:player)
      battle.war = @war
      battle.save!
      
      battles = @war.as_json(include_battles: 'yes')['battles']
      expect(battles).to be_present
      expect(battles.is_a?(Array)).to be_truthy
      expect(battles.count).to eq(1)

      battles = @war.as_json(include_all: 'yes')['battles']
      expect(battles).to be_present
      expect(battles.is_a?(Array)).to be_truthy
      expect(battles.count).to eq(1)
    end

    it "should return clans as an array if clans are requested" do
      clans = @war.as_json(include_clans: 'yes')['clans']
      expect(clans).to be_present
      expect(clans.is_a?(Array)).to be_truthy
      expect(clans.count).to eq(2)

      clans = @war.as_json(include_all: 'yes')['clans']
      expect(clans).to be_present
      expect(clans.is_a?(Array)).to be_truthy
      expect(clans.count).to eq(2)
    end

    it "should return clans (if requested) with 'player_count' key" do
      clan = @war.as_json(include_clans: 'yes')['clans'][0]
      expect(clan['player_count']).to be_present
    end

    it "should return clans (if requested) with 'stars_earned' key" do
      clan = @war.as_json(include_clans: 'yes')['clans'][0]
      expect(clan['stars_earned']).to be_present
    end

    it "should return clans (if requested) with 'winner' key" do
      clan = @war.as_json(include_clans: 'yes')['clans'][0]
      expect(clan.has_key?('winner')).to be_truthy
    end

    it "should return created_at as YYYY-mm-dd" do
      expect(@war.as_json['created_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end

    it "should return updated_at as YYYY-mm-dd" do
      expect(@war.as_json['updated_at']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end

    it "should return war_date as YYYY-mm-dd" do
      @war.war_date = Time.now.utc.to_date
      expect(@war.as_json['war_date']).to eq(Time.now.utc.to_date.strftime("%Y-%m-%d"))
    end
  end

  describe "clans" do
    it "should be exactly two clans per war" do
      expect(@war.clans.count).to eq(2)

      @war.clan_wars = [ FactoryGirl.build(:clan_war, war: @war) ]
      expect(@war).to be_invalid
    end

    describe "should have zero or one winning clan" do

      it "should allow for one winning clan" do
        winning_clan = FactoryGirl.build(:clan)
        winning_clan_war = FactoryGirl.build(:clan_war, clan: winning_clan, war: @war, winner: true)
        losing_clan = FactoryGirl.build(:clan)
        losing_clan_war = FactoryGirl.build(:clan_war, clan: losing_clan, war: @war, winner: false)

        @war.clan_wars = [ winning_clan_war, losing_clan_war ]
        expect(@war).to be_valid
      end

      it "should allow for two losing clans" do
        losing_clan = FactoryGirl.build(:clan)
        losing_clan_war = FactoryGirl.build(:clan_war, clan: losing_clan, war: @war, winner: false)
        losing_clan2 = FactoryGirl.build(:clan)
        losing_clan_war2 = FactoryGirl.build(:clan_war, clan: losing_clan2, war: @war, winner: false)
        
        @war.clan_wars = [ losing_clan_war, losing_clan_war2]
        expect(@war).to be_valid
      end

      it "should not allow for two winning clans" do
        winning_clan = FactoryGirl.build(:clan)
        winning_clan_war = FactoryGirl.build(:clan_war, clan: winning_clan, war: @war, winner: true)
        winning_clan2 = FactoryGirl.build(:clan)
        winning_clan_war2 = FactoryGirl.build(:clan_war, clan: winning_clan2, war: @war, winner: true)
        
        @war.clan_wars = [ winning_clan_war, winning_clan_war2 ]
        expect(@war).to be_invalid
      end
    end
  end

  describe "destroy" do
    it "should remove the battles and clan_wars from the DB" do
      # make war
      war = FactoryGirl.build(:war)
      clan_war1 = FactoryGirl.build(:clan_war, war: war)
      clan_war2 = FactoryGirl.build(:clan_war, war: war)
      war.clan_wars = [ clan_war1, clan_war2 ]
      war.save
      # with battles
      3.times do
        battle = FactoryGirl.build(:battle)
        battle.attacker = FactoryGirl.build(:player)
        battle.defender = FactoryGirl.build(:player)
        battle.war = war
        battle.save
      end
      # expect it to have things referencing its id
      war_id = war.id
      expect(Battle.where(war_id: war_id).count).to eq(3)
      expect(ClanWar.where(war_id: war_id).count).to eq(2)
      # no mister Bond, I expect you to die
      war.destroy
      expect(Battle.where(war_id: war_id).count).to eq(0)
      expect(ClanWar.where(war_id: war_id).count).to eq(0)
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

require 'rails_helper'

RSpec.describe Clan do
  
  # TOMAYBE:
  # might want to refactor this to be a .build before each,
  # a specify { expect(@clan).to be_valid }, then only save
  # (and then destroy) when you need to check uniqueness as
  # doing so would be (perhaps only marginally) faster.

  before(:each) do
    @clan = FactoryGirl.create(:clan)
  end

  after(:each) do
    @clan.destroy
  end

  it_should_behave_like(
    "single attribute validateable", 
    Clan, 
    :clan_tag, 
    nil, 
    ["is required."]
  )

  describe "clan_tag" do
    it "should be present" do
      @clan.clan_tag = nil
      expect(@clan).to be_invalid
    end

    it "should not be allowed if another user has the same clan tag (not unique)" do
      clan2 = FactoryGirl.build(:clan)
      expect(clan2).to be_invalid
    end

    it "should be allowed if no other user has the same clan tag (unique)" do
      clan3 = FactoryGirl.build(:clan, clan_tag: "#FOOBAR42") # bah! I hate it when get rid of the war results history.  I suppose that's kind of obvious given this site...
      expect(clan3).to be_valid
    end

    it "should be eight or nine characters long, begin with a '#', and continue with alpha/numeric" do
      # in character range but doesn't start with '#'
      @clan.clan_tag = "ABCDEFGHI"
      expect(@clan).to be_invalid

      # starts with '#' but total is over the max characters
      @clan.clan_tag =  "#ABCDEFGHI"
      expect(@clan).to be_invalid

      # starts with '#' but total is under the min characters
      @clan.clan_tag = "#ABCDEF"
      expect(@clan).to be_invalid

      # in character range but has special characters
      @clan.clan_tag = "#A}CDEFG"
      expect(@clan).to be_invalid

      # eight characters of proper formatting
      @clan.clan_tag = "#8LYRQ8Y" # shout out to alexander
      expect(@clan).to be_invalid

      # nine characters of proper formatting
      @clan.clan_tag "#8JR8G8L9"
      expect(@clan).to be_valid
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

    it "should be defaulted to 'Anyone can join'" do
      clan2 = Clan.new
      expect(clan2.clan_type).to equal("Anyone can join")
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

      @clan.wars_won = 92.7 # The Beat
      expect(@clan).to be_invalid
    end
  end

end

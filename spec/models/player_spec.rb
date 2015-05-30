require 'rails_helper'

RSpec.describe Player do
  
  before(:each) do
    @player = FactoryGirl.build(:player)
  end

  specify { expect(@player).to be_valid }

  it_should_behave_like(
    "single attribute validateable", 
    Player, 
    :player_tag, 
    nil, 
    ["is required."]
  )

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

  describe "player_tag" do
    it "should be present" do
      @player.player_tag = nil
      expect(@player).to be_invalid
    end

    it "should be unique" do
      persisted_player = @player.dup
      persisted_player.save

      player2 = FactoryGirl.build(:player, player_tag: persisted_player.player_tag)
      expect(player2).to be_invalid

      player2.player_tag = "#PQVUJ2PR" # shout out to Count Dubula
      expect(player2).to be_valid

      persisted_player.delete
    end

    # this was the moment I appreciated something about TDD, it let's
    # you clear out part of your mind (by getting all the rules out)
    # so you can think more clearly when you're creating models and
    # building out relationships.
    it "should be eight or nine characters long, begin with a '#', and continue with alpha/numeric" do
      # in character range but doesn't start with '#'
      @player.player_tag = "ABCDEFGHI"
      expect(@player).to be_invalid

      # starts with '#' but total is over the max characters
      @player.player_tag =  "#ABCDEFGHI"
      expect(@player).to be_invalid

      # starts with '#' but total is under the min characters
      @player.player_tag = "#ABCDEF"
      expect(@player).to be_invalid

      # in character range but has special characters
      @player.player_tag = "#A}CDEFG"
      expect(@player).to be_invalid

      # eight characters of proper formatting
      @player.player_tag = "#8LYRQ8Y" # shout out to alexander
      expect(@player).to be_invalid

      # nine characters of proper formatting
      @player.player_tag = "#RCQOJOJR"
      expect(@player).to be_valid
    end
  end

end

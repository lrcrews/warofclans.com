require 'rails_helper'

RSpec.describe Player do
  
  before(:each) do
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

require 'rails_helper'

RSpec.describe War, type: :model do

  before(:each) do
    @war = FactoryGirl.build(:war)
  end

  specify { expect(@war).to be_valid }

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

end

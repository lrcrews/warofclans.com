require 'rails_helper'

RSpec.describe User do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  after(:each) do
    @user.destroy
  end

  it_should_behave_like(
    "single attribute validateable", 
    User, 
    "email", 
    "rr@supergreen.com", 
    []
  )
  
  it_should_behave_like(
    "single attribute validateable", 
    User, 
    :email, 
    "rr@supergreen.com", 
    []
  )

  it_should_behave_like(
    "single attribute validateable", 
    User, 
    :email, 
    "1337", 
    ["is invalid"]
  )

  describe "email" do
    it "should not be allowed if another user has the same email (not unique)" do
      user2 = FactoryGirl.build(:user)
      expect(user2).to be_invalid
    end

    it "should be allowed if no other user has the same email (unique)" do
      user3 = FactoryGirl.build(:user, email: "korbind@zorg.com")
      expect(user3).to be_valid
    end
  end

end

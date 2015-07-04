require 'rails_helper'

RSpec.describe User do
  
  before :each do
    @user = FactoryGirl.build(:user)
  end

  specify { expect(@user).to be_valid }

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
    it "should be unique" do
      persisted_user = @user.dup
      persisted_user.save

      user2 = FactoryGirl.build(:user, email: persisted_user.email)
      expect(user2).to be_invalid

      user2.email = "korbind@zorg.com"
      expect(user2).to be_valid

      persisted_user.delete
    end
  end

end

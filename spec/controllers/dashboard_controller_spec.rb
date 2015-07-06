require 'rails_helper'

RSpec.describe DashboardController do

  describe "GET index" do

    before :each do
      10.times do
        war = FactoryGirl.build(:war)
        clan_war1 = FactoryGirl.build(:clan_war, war: war)
        clan_war2 = FactoryGirl.build(:clan_war, war: war)
        war.clan_wars = [ clan_war1, clan_war2 ]
        war.save
      end
      expect(War.count).to eq(10)
    end

    after :each do
      War.destroy_all
    end

    it "assigns @wars" do
      get :index
      expect(assigns(:wars)).to eq(War.all)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end
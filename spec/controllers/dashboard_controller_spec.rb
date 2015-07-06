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

    it "response body contains wars, the list of all wars" do
      get :index, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["wars"]).to eq(War.all.as_json)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

end

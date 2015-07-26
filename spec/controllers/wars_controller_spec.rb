require 'rails_helper'

RSpec.describe WarsController, type: :controller do

  describe "GET index" do

    before :each do
      10.times do
        clan_1 = FactoryGirl.create(:clan)
        clan_2 = FactoryGirl.create(:clan)
        war = FactoryGirl.build(:war)
        clan_war1 = FactoryGirl.build(:clan_war, war: war, clan: clan_1)
        clan_war2 = FactoryGirl.build(:clan_war, war: war, clan: clan_2)
        war.clan_wars = [ clan_war1, clan_war2 ]
        war.save
      end
      expect(War.count).to eq(10)
    end

    after :each do
      War.destroy_all
      expect(War.count).to eq(0)
    end

    it "response body contains wars, the list of all wars ordered by descending created_at values, along with the clans in each war" do
      get :index, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["wars"]).to eq(War.all.order(created_at: 'DESC').as_json(include_clans: "yes"))
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show/:id" do

    before :each do
      clan_1 = FactoryGirl.create(:clan)
      clan_2 = FactoryGirl.create(:clan)
      @war = FactoryGirl.build(:war)
      clan_war1 = FactoryGirl.build(:clan_war, war: @war, clan: clan_1)
      clan_war2 = FactoryGirl.build(:clan_war, war: @war, clan: clan_2)
      @war.clan_wars = [ clan_war1, clan_war2 ]
      @war.save
    end

    after :each do
      @war.destroy
    end

    it "redirects to the wars index url if the id given doesn't exist" do
      get :show, id: 0
      #expect(response).to render_template("index")
      expect(response).to redirect_to(wars_url)
    end

    it "response body contains war, the war object with the include_all option" do
      get :show, id: @war.id, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["war"]).to eq(@war.as_json(include_all: "yes"))
    end

    it "renders the show template" do
      get :show, id: @war.id
      expect(response).to render_template("show")
    end
  end

end

require 'rails_helper'

RSpec.describe ClansController, type: :controller do

  describe "GET index" do

    before :each do
      10.times do
        clan = FactoryGirl.create(:clan)
        4.times do
          clan_player = FactoryGirl.create(:clan_player, clan: clan)
          clan.clan_players << clan_player
        end
        clan.save
      end
      expect(Clan.count).to eq(10)
      expect(Clan.first.players.count).to eq(4)
    end

    after :each do
      ClanPlayer.destroy_all
      Clan.destroy_all
      Player.destroy_all
      expect(ClanPlayer.count).to eq(0)
      expect(Clan.count).to eq(0)
      expect(Player.count).to eq(0)
    end

    it "response body contains clans, the list of all clans ordered by name" do
      get :index, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["clans"]).to eq(Clan.all.order(:name).as_json)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show/:id" do

    before :each do
      @clan = FactoryGirl.create(:clan)
    end

    after :each do
      @clan.destroy
    end

    it "redirects to the clans index url if the id given doesn't exist" do
      get :show, id: 0
      expect(response).to redirect_to(clans_url)
    end

    it "response body contains clan, the clan object with the include_all option" do
      get :show, id: @clan.id, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["clan"]).to eq(@clan.as_json(include_all: "yes"))
    end

    it "renders the show template" do
      get :show, id: @clan.id
      expect(response).to render_template("show")
    end
  end

end

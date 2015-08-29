require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "GET show/:id" do

    before :each do
      @player = FactoryGirl.create(:player)
    end

    after :each do
      @player.destroy
    end

    it "redirects to the homepage if the id given doesn't exist" do
      get :show, id: 0
      expect(response).to redirect_to(root_url)
    end

    it "response body contains player, the Player object with the include_all option" do
      get :show, id: @player.id, format: :json
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["player"]).to eq(@player.as_json(include_all: "yes"))
    end

    it "renders the show template" do
      get :show, id: @player.id
      expect(response).to render_template("show")
    end
  end

end

class PlayersController < ApplicationController

  def show
    player = Player.includes([{attacks: [:attacker, :defender]}, :clan_players, :clans, {defences: [:attacker, :defender]}])
                   .find_by_id(params[:id])
    redirect_to root_url and return if player.nil?
    gon.player = player.as_json(include_all: "yes")
    respond_to do |format|
      format.html # players/show.html.erb
      format.json do
        render json: { player: gon.player },
               status: :success
      end
    end
  end

end

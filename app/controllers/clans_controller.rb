class ClansController < ApplicationController

  def index
    gon.clans = Clan.all.as_json
    respond_to do |format|
      format.html # clans/index.html.erb
      format.json do
        render json: { clans: gon.clans },
               status: :success
      end
    end
  end


  def show
    clan = Clan.includes([{wars: [{battles: [:attacker, :defender]}, :clan_wars, :clans]}])
               .find_by_id(params[:id])
    redirect_to clans_url and return if clan.nil?
    gon.clan = clan.as_json(include_all: "yes")
    respond_to do |format|
      format.html # clans/show.html.erb
      format.json do
        render json: { clan: gon.clan },
               status: :success
      end
    end
  end

end

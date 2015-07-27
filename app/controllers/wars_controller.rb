class WarsController < ApplicationController

  def index
    gon.wars = War.recent.includes(:clans, :clan_wars).as_json(include_clans: "yes")
    respond_to do |format|
      format.html # wars/index.html.erb
      format.json do
        render json: { wars: gon.wars },
               status: :success
      end
    end
  end


  def show
    war = War.find_by_id(params[:id])
    redirect_to wars_url and return if war.nil?
    gon.war = war.as_json(include_all: "yes")
    respond_to do |format|
      format.html # wars/show.html.erb
      format.json do
        render json: { war: gon.war },
               status: :success
      end
    end
  end

end

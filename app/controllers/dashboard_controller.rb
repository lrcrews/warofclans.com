class DashboardController < ApplicationController


  def index
    gon.wars = War.recent.includes(:clans, :clan_wars).as_json(include_clans: "yes")
    respond_to do |format|
      format.html # dashboard/index.html.erb
      format.json do
        render json: { wars: gon.wars },
               status: :success
      end
    end
  end


  def register_interest
    PotentialUser.create(email: params[:beta_email])
    respond_to do |format|
      format.json do
        render json: { message: "if it worked, it worked, if it didn't, eh, eff it." }
      end
    end
  end


end

class DashboardController < ApplicationController

  def index
    gon.wars = War.all.includes(:clan_wars).as_json(include_clans: "yes")
    respond_to do |format|
      format.html # dashboard/index.html.erb
      format.json do
        render json: { wars: gon.wars },
               status: :success
      end
    end
  end

end

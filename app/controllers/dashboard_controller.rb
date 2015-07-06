class DashboardController < ApplicationController

  def index
    gon.wars = War.all.as_json
    respond_to do |format|
      format.html # dashboard/index.html.erb
      format.json do
        render json: { wars: gon.wars },
               status: :success
      end
    end
  end

end

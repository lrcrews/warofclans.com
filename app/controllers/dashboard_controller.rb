class DashboardController < ApplicationController

  def index
    @wars = War.all
  end

end

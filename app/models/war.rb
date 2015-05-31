class War < ActiveRecord::Base

  has_one :blue_team, class_name: "Clan", foreign_key: "blue_team_id"
  has_one :red_team, class_name: "Clan", foreign_key: "red_team_id"

end

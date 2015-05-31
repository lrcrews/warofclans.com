class War < ActiveRecord::Base

  belongs_to :blue_team, class_name: "Clan", foreign_key: "blue_team_id"
  belongs_to :red_team, class_name: "Clan", foreign_key: "red_team_id"
  has_many :battles

  scope :for_clan, -> (clan) { where("blue_team_id = ? OR red_team_id = ?", clan.id, clan.id) unless clan.nil? }

end

class RemoveRedTeamBlueTeam < ActiveRecord::Migration
  def change
    remove_index :wars, :blue_team_id
    remove_index :wars, :red_team_id

    remove_column :wars, :blue_team_id
    remove_column :wars, :red_team_id
  end
end

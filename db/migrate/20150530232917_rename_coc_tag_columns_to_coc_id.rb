class RenameCocTagColumnsToCocId < ActiveRecord::Migration
  def change
    rename_column :clans, :clan_tag, :coc_id
    rename_column :players, :player_tag, :coc_id
  end
end

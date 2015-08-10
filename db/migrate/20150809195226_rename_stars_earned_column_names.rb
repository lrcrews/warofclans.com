class RenameStarsEarnedColumnNames < ActiveRecord::Migration
  def change
    rename_column :battles, :stars_earned, :war_stars_awarded
    rename_column :clan_wars, :stars_earned, :war_stars_awarded
  end
end

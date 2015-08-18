class AddDefaultToWarStarsAwardedOnClanWars < ActiveRecord::Migration
  def change
    change_column :clan_wars, :war_stars_awarded, :integer, default: 0
  end
end

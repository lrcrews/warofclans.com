class AddPlayerCountAndStarsEarnedToClanWars < ActiveRecord::Migration
  def change
    add_column :clan_wars, :player_count, :integer
    add_column :clan_wars, :stars_earned, :integer
  end
end

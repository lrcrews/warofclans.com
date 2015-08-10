class AddCounterColumnsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :attacks_won, :integer, default: 0
    add_column :players, :attacks_won_with_war_stars, :integer, default: 0
    add_column :players, :defences_won_completely, :integer, default: 0
    add_column :players, :defences_won_war_stars_defended, :integer, default: 0
    add_column :players, :stars, :integer, default: 0
    add_column :players, :stars_lost, :integer, default: 0
    add_column :players, :war_stars, :integer, default: 0
    add_column :players, :war_stars_lost, :integer, default: 0
  end
end

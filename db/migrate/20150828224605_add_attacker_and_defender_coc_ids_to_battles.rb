class AddAttackerAndDefenderCocIdsToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :attacker_clan_coc_id, :string
    add_column :battles, :defender_clan_coc_id, :string
  end
end

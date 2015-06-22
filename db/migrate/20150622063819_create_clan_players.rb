class CreateClanPlayers < ActiveRecord::Migration
  def change
    create_table :clan_players do |t|
      t.integer :clan_id
      t.integer :player_id
      t.boolean :active

      t.timestamps null: false
    end

    add_index :clan_players , [:clan_id , :player_id] , unique: true
  end
end

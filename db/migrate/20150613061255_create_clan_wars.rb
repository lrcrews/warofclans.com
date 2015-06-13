class CreateClanWars < ActiveRecord::Migration
  def change
    create_table :clan_wars do |t|
      t.integer :clan_id
      t.integer :war_id
      t.boolean :winner

      t.timestamps null: false
    end

    add_index :clan_wars , [:clan_id , :war_id] , unique: true
  end
end

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :level
      t.string  :name
      t.string  :player_tag

      t.timestamps null: false
    end
  end
end

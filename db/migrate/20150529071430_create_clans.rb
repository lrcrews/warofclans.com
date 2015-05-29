class CreateClans < ActiveRecord::Migration
  def change
    create_table :clans do |t|
      t.string  :clan_tag
      t.string  :clan_type, default: "Anyone can join"
      t.integer :level, default: 1
      t.string  :name
      t.integer :required_trophies, default: 0
      t.string  :war_frequency
      t.integer :wars_won, default: 0

      t.timestamps null: false
    end
  end
end

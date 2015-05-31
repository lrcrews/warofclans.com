class CreateWars < ActiveRecord::Migration
  def change
    create_table :wars do |t|
      t.integer :blue_team_id
      t.integer :red_team_id
      t.date :war_date

      t.timestamps null: false
    end

    add_index :wars, :blue_team_id
    add_index :wars, :red_team_id
  end
end

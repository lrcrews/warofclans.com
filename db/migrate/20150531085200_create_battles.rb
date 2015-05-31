class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :attacker_id
      t.integer :attacker_rank
      t.integer :defender_id
      t.integer :defender_rank
      t.integer :destruction_percent  # i.e., the 42 in 42%
      t.integer :minutes_left_in_war  # input will have hour and minute selection
      t.integer :stars_awarded        # total star damage
      t.integer :stars_earned         # stars actually added to war total

      t.timestamps null: false
    end

    add_index :battles, :attacker_id
    add_index :battles, :defender_id

    add_reference :battles, :war, index: true
  end
end

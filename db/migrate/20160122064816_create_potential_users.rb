class CreatePotentialUsers < ActiveRecord::Migration
  def change
    create_table :potential_users do |t|
      t.string :email
      t.timestamps
    end
  end
end

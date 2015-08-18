class AddCounterCacheForAttacksAndDefencesToPlayers < ActiveRecord::Migration
  def change
    # I am aware of counter caches from rails, but I've had issues
    # with those not updating properly in a couple different production
    # apps, and while those were more complicated and the increment
    # and decrement calls would likely suffice here, ef, fuck it, it's
    # not that big of a deal to do this, and now it at least looks like
    # other (non relationship based) counter columns in the code, which
    # means we have a consistent implementation.
    add_column :players, :total_attacks, :integer, default: 0
    add_column :players, :total_defences, :integer, default: 0
  end
end

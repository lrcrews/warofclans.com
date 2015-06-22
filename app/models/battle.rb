class Battle < ActiveRecord::Base

  belongs_to :war

  belongs_to :attacker, class_name: "Player", foreign_key: "attacker_id"
  belongs_to :defender, class_name: "Player", foreign_key: "defender_id"

  validates :attacker, presence: true
  validates :defender, presence: true

end

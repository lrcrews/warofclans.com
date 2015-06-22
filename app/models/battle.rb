class Battle < ActiveRecord::Base

  belongs_to :war

  belongs_to :attacker, class_name: "Player", foreign_key: "attacker_id"
  belongs_to :defender, class_name: "Player", foreign_key: "defender_id"

  validates :attacker, presence: true
  
  validates :attacker_rank, 
            numericality: { 
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 50,
              only_integer: true 
            }
  
  validates :defender, presence: true
  
  validates :defender_rank, 
            numericality: { 
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 50,
              only_integer: true 
            }
  
  validates :destruction_percent, 
            numericality: { 
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100,
              only_integer: true 
            }
  
  validates :minutes_left_in_war, 
            numericality: { 
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 1440,
              only_integer: true 
            }

  validates :war, presence: true

end

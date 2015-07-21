class Battle < ActiveRecord::Base

  # TODO:
  # ok, I'm finding these names confusing, so I should change them later
  # but for now....
  #
  # stars_awarded are the stars you get in your attack
  # stars_earned are the stars from that attack that actually count towards the war total

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
  
  validates :stars_awarded, 
            numericality: { 
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 3,
              only_integer: true 
            }
  
  validates :stars_earned, 
            numericality: { 
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 3,
              only_integer: true 
            }

  validates :war, presence: true

  validate :validate_awarded_stars_vs_destruction_percent
  validate :validate_awarded_vs_earned_stars


  def validate_awarded_stars_vs_destruction_percent
    if self.destruction_percent.present? && self.stars_awarded.present?
      if self.destruction_percent == 100 && self.stars_awarded != 3
        errors.add(:stars_awarded, "should be 3 if base completely destroyed")
      end
      if self.destruction_percent < 100 && self.stars_awarded == 3
        errors.add(:stars_awarded, "should not be 3 if base wasn't completely destroyed")
      end
    end
  end

  def validate_awarded_vs_earned_stars
    if self.stars_awarded.present? && self.stars_earned.present?
      if self.stars_earned > self.stars_awarded
        errors.add(:stars_earned, "may not be greater than the number awarded")
      end
    end
  end

end

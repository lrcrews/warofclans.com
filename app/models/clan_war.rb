class ClanWar < ActiveRecord::Base

  belongs_to :clan
  belongs_to :war


  validates :player_count, presence: true, numericality: { only_integer: true }
  validates :stars_earned, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  validate :validate_player_count_5_to_50
  validate :validate_stars_earned_not_infeasible

  def validate_player_count_5_to_50
    if self.player_count.present?
      if self.player_count < 5
        self.errors.add(:player_count, "should be at least 5")
      elsif self.player_count > 50
        self.errors.add(:player_count, "should be less than 50")
      elsif self.player_count % 5 > 0
        self.errors.add(:player_count, "should be a multiple of 5")
      end
    end
  end

  def validate_stars_earned_not_infeasible
    if self.stars_earned.present? && self.player_count.present? 
      max = self.player_count * 3
      if self.stars_earned > max
        self.errors.add(:stars_earned, "should be less than #{max}")
      end
    end
  end

end

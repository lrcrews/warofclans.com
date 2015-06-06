class War < ActiveRecord::Base

  has_many :battles

  validates :war_date, presence: true

  validate :validate_war_date_in_the_past

  def validate_war_date_in_the_past
    if self.war_date.present? && self.war_date > Date.today
      self.errors.add(:war_date, "war date cannot be in the future")
    end
  end

end

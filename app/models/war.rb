class War < ActiveRecord::Base

  has_many :battles
  has_many :clan_wars
  has_many :clans, through: :clan_wars

  validates :war_date, presence: true

  validate :validate_one_or_less_winner
  validate :validate_two_clans_present
  validate :validate_war_date_in_the_past

  def validate_one_or_less_winner
    winner_count = 0
    self.clan_wars.each do |clan_war|
      winner_count += 1 if clan_war.winner?
    end
    if winner_count > 1
      self.errors.add(:clan_wars, "may not have more than one winner.")
    end
  end

  def validate_two_clans_present
    if self.clan_wars.length != 2
      self.errors.add(:clan_wars, "it takes two to tango.")
    end
  end

  def validate_war_date_in_the_past
    if self.war_date.present? && self.war_date > Date.today
      self.errors.add(:war_date, "war date cannot be in the future")
    end
  end

  def winning_clan?(clan)
    winner = self.clan_wars.where(winner: true).first
    winner.present? ? winner.clan == clan : false
  end

  def as_json
    json = super
    json['war_date'] = self.war_date.to_s
  end

end

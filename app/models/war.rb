class War < ActiveRecord::Base

  has_many :battles, dependent: :destroy
  has_many :clan_wars, dependent: :destroy
  has_many :clans, through: :clan_wars


  default_scope { order(created_at: 'DESC') }

  scope :recent, -> { order(created_at: 'DESC') }


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

  def as_json(options={})
    options = {} if options.nil?
    # include all the normal stuff
    json = super
    # overwrite and add other stuff
    json['battle_count'] = self.battles.count
    json['created_at'] = self.created_at.to_date.to_s
    json['updated_at'] = self.updated_at.to_date.to_s
    json['war_date'] = self.war_date.to_s

    # include all, or just some, related objects
    # as_json as well

    include_all = options[:include_all] == 'yes'

    if include_all || options[:include_battles] == 'yes'
      json.merge!('battles' => self.battles.as_json)
    end

    if include_all || options[:include_clans] == "yes"
      clans = []
      self.clan_wars.each do |clan_war|
        details_hash = {
          'team_size' => clan_war.player_count,
          'war_stars_awarded' => clan_war.war_stars_awarded,
          'winner' => clan_war.winner?
        }
        clans << clan_war.clan.as_json.merge!(details_hash)
      end
      json['clans'] = clans
    end

    # give the people what they want
    json
  end

end

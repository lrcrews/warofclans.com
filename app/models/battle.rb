class Battle < ActiveRecord::Base

  before_create :set_clan_coc_ids

  after_create :fire_counter_update_jobs


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
  
  validates :war_stars_awarded, 
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
    if self.stars_awarded.present? && self.war_stars_awarded.present?
      if self.war_stars_awarded > self.stars_awarded
        errors.add(:war_stars_awarded, "may not be greater than the number awarded")
      end
    end
  end

  def attacker_earned_stars_for_clan?
    self.war_stars_awarded > 0
  end

  def attacker_victorious?
    self.stars_awarded > 0
  end

  def defended_completely?
    self.stars_awarded == 0
  end

  def defended_war_stars?
    self.war_stars_awarded == 0
  end

  def as_json(options={})
    options = {} if options.nil?
    # include all the normal stuff
    json = super
    # overwrite and add other stuff
    json['attacker_earned_stars_for_clan'] = self.attacker_earned_stars_for_clan?
    json['attacker_victorious'] = self.attacker_victorious?
    json['created_at'] = self.created_at.to_date.to_s
    json['updated_at'] = self.updated_at.to_date.to_s

    # we always want to load up the attacker and defender
    json['attacker'] = self.attacker.as_json
    json['defender'] = self.defender.as_json
    
    # include all, or just some, related objects
    # as_json as well

    include_all = options[:include_all] == 'yes'

    if include_all || options[:include_war] == 'yes'
      json.merge!('war' => self.war.as_json)
    end
    # give the people what they want
    json
  end

  def fire_counter_update_jobs
    update_attacker
    update_attackers_clan_war
    update_defender
  end


  private

    # TODO: for MVP we're just assuming only one clan is
    #       marked 'active', but that's not enforced yet
    def set_clan_coc_ids
      self.attacker_clan_coc_id = self.attacker.active_clan.coc_id
      self.defender_clan_coc_id = self.defender.active_clan.coc_id
    end

    # TODO: these should be async jobs

    def update_attacker
      self.attacker.update_offensive_counters(self)
    end

    def update_attackers_clan_war
      attackers_clan_war = self.war.clan_war_for_player(attacker)
      if attackers_clan_war.present?
        attackers_clan_war.update_war_stars_won_counter(self)
      end
    end

    def update_defender
      self.defender.update_defensive_counters(self)
    end


end

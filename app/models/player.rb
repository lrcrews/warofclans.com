class Player < ActiveRecord::Base
  include CocIdentifiable
  include SingleAttributeValidateable


  has_many :attacks, class_name: "Battle", foreign_key: "attacker_id"
  has_many :defences, class_name: "Battle", foreign_key: "defender_id"

  has_many :clan_players
  has_many :clans, through: :clan_players


  scope :active, -> { joins(:clan_players).where("clan_players.active = ?", true) }
  scope :for_clan, -> (clan) { joins(:clan_players).where("clan_players.clan_id = ?", clan.id) unless clan.nil? }
  

  validates :level, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 999,
              only_integer: true
            }

  validates :name, presence: true


  # TODO: for mvp this assumes there can be only one
  #        ... Highlander!
  def active_clan
    clan_player = self.clan_players.where("clan_players.active = ?", true).first
    if clan_player.nil?
      Clan.new
    else
      clan_player.clan
    end
  end


  def as_json(options={})
    options = {} if options.nil?
    # include all the normal stuff
    json = super
    # overwrite and add other stuff
    json['created_at'] = self.created_at.to_date.to_s
    json['updated_at'] = self.updated_at.to_date.to_s

    # include all, or just some, related objects
    # as_json as well

    include_all = options[:include_all] == 'yes'

    if include_all || 
       options[:include_battles] == 'yes' || 
       options[:include_attacks] == 'yes'
      json.merge!('attacks' => self.attacks.as_json)
    end

    if include_all || 
       options[:include_battles] == 'yes' || 
       options[:include_defences] == 'yes'
      json.merge!('defences' => self.defences.as_json)
    end

    if include_all || options[:include_clans] == "yes"
      clans = []
      self.clan_players.each do |clan_player|
        clans << clan_player.clan.as_json.merge!({'active' => clan_player.active})
      end
      json['clans'] = clans
    end

    # give the people what they want
    json
  end


  def update_defensive_counters(battle)
    self.total_defences += 1
    self.defences_won_completely += 1 if battle.defended_completely?
    self.defences_won_war_stars_defended += 1 if battle.defended_war_stars?
    self.stars_lost += battle.stars_awarded
    self.war_stars_lost += battle.war_stars_awarded
    self.save if self.changed?
  end


  def update_offensive_counters(battle)
    self.total_attacks += 1
    self.attacks_won += 1 if battle.attacker_victorious?
    self.attacks_won_with_war_stars += 1 if battle.attacker_earned_stars_for_clan?
    self.stars += battle.stars_awarded
    self.war_stars += battle.war_stars_awarded
    self.save if self.changed?
  end

end

class Clan < ActiveRecord::Base
  include CocIdentifiable
  include SingleAttributeValidateable

  
  CLAN_TYPE_ANYONE = "Anyone can join"
  CLAN_TYPE_CLOSED = "Closed"
  CLAN_TYPE_INVITE = "Invite only"
  
  CLAN_TYPES = [
    CLAN_TYPE_ANYONE, CLAN_TYPE_CLOSED, CLAN_TYPE_INVITE
  ] 

  
  WAR_FREQUENCY_ALWAYS = "Always"
  WAR_FREQUENCY_NEVER = "Never"
  WAR_FREQUENCY_NOT_SET = "Not set"
  WAR_FREQUENCY_TWICE_WEEKLY = "Twice a week"
  WAR_FREQUENCY_WEEKLY = "Once a week"
  WAR_FREQUENCY_RARELY = "Rarely"
  
  WAR_FREQUENCIES = [
    WAR_FREQUENCY_ALWAYS, WAR_FREQUENCY_NEVER, WAR_FREQUENCY_NOT_SET,
    WAR_FREQUENCY_TWICE_WEEKLY, WAR_FREQUENCY_WEEKLY, WAR_FREQUENCY_RARELY
  ]

  
  before_save :update_wars_won

  
  has_many :clan_wars
  has_many :wars, through: :clan_wars

  has_many :clan_players
  has_many :players, through: :clan_players

  
  validates :clan_type, presence: true, inclusion: { in: CLAN_TYPES }

  validates :level, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 10,
              only_integer: true
            }

  validates :name, presence: true

  validates :required_trophies, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }

  validates :war_frequency, presence: true, inclusion: { in: WAR_FREQUENCIES }

  validates :wars_won, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 0,
              only_integer: true
            }


  def active_players
    Player.for_clan(self).active
  end

  def has_player?(player)
    self.players.include?(player)
  end

  def as_json(options={})
    options = {} if options.nil?
    # include all the normal stuff
    json = super
    # overwrite and add other stuff
    json['created_at'] = self.created_at.to_date.to_s
    json['player_count'] = self.active_players.count
    json['updated_at'] = self.updated_at.to_date.to_s
    json['wars_in_system_count'] = self.wars.count
    
    # include all, or just some, related objects
    # as_json as well

    include_all = options[:include_all] == 'yes'

    if include_all || options[:include_players] == 'yes'
      json.merge!('players' => self.players.as_json)
    end

    if include_all || options[:include_wars] == "yes"
      json.merge!('wars' => self.wars.as_json(include_all: 'yes'))
    end

    # give the people what they want
    json
  end


  private

    def update_wars_won
      winner_count = self.clan_wars.where(winner: true).count
      if self.wars_won < winner_count
        self.wars_won = winner_count
      end
    end

end

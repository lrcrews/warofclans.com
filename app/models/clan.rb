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
  WAR_FREQUENCY_TWICE_WEEKLY = "Twice a week"
  WAR_FREQUENCY_WEEKLY = "Once a week"
  WAR_FREQUENCY_RARELY = "Rarely"
  
  WAR_FREQUENCIES = [
    WAR_FREQUENCY_ALWAYS, WAR_FREQUENCY_NEVER, WAR_FREQUENCY_TWICE_WEEKLY, 
    WAR_FREQUENCY_WEEKLY, WAR_FREQUENCY_RARELY
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


  private

    def update_wars_won
      winner_count = self.clan_wars.where(winner: true).count
      if self.wars_won < winner_count
        self.wars_won = winner_count
      end
    end

end

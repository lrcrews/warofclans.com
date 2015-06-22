class Clan < ActiveRecord::Base
  include CocIdentifiable
  include SingleAttributeValidateable

  CLAN_TYPES = [
    "Anyone can join", "Closed", "Invite only"
  ] 

  WAR_FREQUENCIES = [
    "Always", "Never", "Twice a week", "Once a week", "Rarely"
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
    Player.for_clan(self).where("").active
  end


  private

    def update_wars_won
      winner_count = self.clan_wars.where(winner: true).count
      if self.wars_won < winner_count
        self.wars_won = winner_count
      end
    end

end

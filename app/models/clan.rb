class Clan < ActiveRecord::Base
  include CocIdentifiable
  include SingleAttributeValidateable

  CLAN_TYPES = [
    "Anyone can join", "Closed", "Invite only"
  ] 

  WAR_FREQUENCIES = [
    "Always", "Never", "Twice a week", "Once a week", "Rarely"
  ]

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

end

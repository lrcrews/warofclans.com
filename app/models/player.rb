class Player < ActiveRecord::Base
  include CocIdentifiable
  include SingleAttributeValidateable


  has_many :attacks, class_name: "Battle", foreign_key: "attacker_id"
  has_many :defences, class_name: "Battle", foreign_key: "defender_id"


  validates :level, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 999,
              only_integer: true
            }

  validates :name, presence: true

end

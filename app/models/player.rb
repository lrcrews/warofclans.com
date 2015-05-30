class Player < ActiveRecord::Base
  include SingleAttributeValidateable

  validates :level, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 999,
              only_integer: true
            }

  validates :name, presence: true

  validates :player_tag, presence: true, uniqueness: true, format: { with: /\A#\w{7,8}\z/ }

end

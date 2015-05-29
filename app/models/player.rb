class Player < ActiveRecord::Base

  validates :level, 
            presence: true, 
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 999,
              only_integer: true
            }

  validates :name, presence: true

end

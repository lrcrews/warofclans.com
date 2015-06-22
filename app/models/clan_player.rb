class ClanPlayer < ActiveRecord::Base

  belongs_to :clan
  belongs_to :player

end

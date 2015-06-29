rb_files = Dir[Rails.root.join("lib/modules/seed/*.rb").to_s]
rb_files.each { |rb| require rb }


# Modularizing so things are easier to find as more seed
# data is enetered and so we keep things DRY when adding
# new seed data (the migration to add the data may call 
# the same modules/methods that are present here).


#########################################
# Players and Clans (this must be first)
#######################################
Seed::ClansAndPlayers::add_clans_and_their_players


##################
# Battles of Wars
################
Seed::WarsAndBattles::add_wars_and_their_battles


# kind of over dramatic on the headers there considering
# this file is only four lines long (don't ya think?).

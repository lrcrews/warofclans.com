# You're looking at the Wars and Battles seed file.
module Seed
  class WarsAndBattles

    class << self

      def add_wars_and_their_battles
        @players = {}
        create_new_world_9_vs_pinkglove
      end


      private

        def create_new_world_9_vs_pinkglove
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          pinkglove = Clan.find_by_coc_id("#QLVJ092")
          if new_world_9.nil? || pinkglove.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and pinkglove ('#QLVJ092')"
            return
          end
          # the war
          war = War.new(war_date: "27/6/2015".to_date)
          clan_war_1 = ClanWar.create(war: war, clan: new_world_9, winner: true)
          war.clan_wars << clan_war_1
          clan_war_2 = ClanWar.create(war: war, clan: pinkglove, winner: false)
          war.clan_wars << clan_war_2
          if !war.save
            puts "WARNING:  war did not properly save, errors: #{war.errors.full_messages}"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(pinkglove)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  15,   @players["#J2UCCR0Y0"],   15, 61,   1417, 1, 1],
            [war, @players["#JJLY8RCJ"],  14,   @players["#P9VVGU9J"],    14, 91,   1407, 2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#2R8QPLVU"],    2,  100,  1407, 3, 3],
            [war, @players["#R9Y8PQ9L"],  12,   @players["#R9Y8PQ9L"],    13, 100,  1391, 3, 3],
            [war, @players["#RCQ0J0JR"],  13,   @players["#JJLY8RCJ"],    14, 100,  1339, 3, 3],
            [war, @players["#G28VPUR"],   8,    @players["#999Y2LU9"],    7,  66,   1322, 2, 2],
            [war, @players["#R9Y8PQ9L"],  13,   @players["#CPG2L0YV"],    15, 100,  1205, 3, 3],
            [war, @players["#R20YLVUP"],  1,    @players["#Q2RJGCJR"],    1,  36,   1074, 0, 0],
            [war, @players["#CPG2L0YV"],  15,   @players["#2090VCURY"],   12, 46,   904,  0, 0],
            [war, @players["#RCQ0J0JR"],  13,   @players["#J2UCCR0Y0"],   15, 100,  770,  3, 2],
            [war, @players["#GY9YL809"],  11,   @players["#2090VCURY"],   12, 100,  657,  3, 3],
            [war, @players["#R9Y8PQ9L"],  13,   @players["#RCQ0J0JR"],    13, 50,   594,  1, 1],
            [war, @players["#2Y28LR9U"],  8,    @players["#9PQ2LV8L"],    12, 56,   457,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#8LG98QC9"],    4,  74,   430,  2, 2],
            [war, @players["#8LG98QC9"],  4,    @players["#PQVUJ2PR"],    3,  54,   400,  2, 2],
            [war, @players["#G28VPUR"],   8,    @players["#2Y28LR9U"],    8,  74,   378,  2, 2],
            [war, @players["#P9VVGU9J"],  14,   @players["#YCP2C90P"],    11, 61,   346,  1, 1],
            [war, @players["#RVJ08JR2"],  2,    @players["#YGPYQ209"],    3,  72,   341,  2, 2],
            [war, @players["#8LYRQ8Y"],   4,    @players["#CQ90P0J"],     6,  84,   320,  2, 2],
            [war, @players["#LLVCLU2G"],  7,    @players["#JP9G2YLL"],    9,  100,  316,  3, 3],
            [war, @players["#PQVUJ2PR"],  3,    @players["#2280C2UQV"],   5,  64,   269,  1, 1],
            [war, @players["#Y2U2Q20G"],  5,    @players["#2280C2UQV"],   5,  65,   269,  2, 1],
            [war, @players["#PV0LJJU0"],  6,    @players["#28UJ9Q09P"],   10, 100,  224,  3, 3],
            [war, @players["#LLVCLU2G"],  7,    @players["#999Y2LU9"],    7,  99,   157,  1, 0],
            [war, @players["#8LYRQ8Y"],   4,    @players["#999Y2LU9"],    7,  100,  152,  3, 1],
            [war, @players["#9PQ2LV8L"],  12,   @players["#YCP2C90P"],    11, 55,   133,  2, 1],
            [war, @players["#P9VVGU9J"],  14,   @players["#J2UCCR0Y0"],   15, 85,   96,   1, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#2Y28LR9U"],    8,  57,   82,   1, 0],
            [war, @players["#YV2J2028"],  9,    @players["#YCP2C90P"],    11, 57,   77,   1, 0],
            [war, @players["#GY9YL809"],  11,   @players["#Q2RJGCJR"],    1,  40,   45,   0, 0],
            [war, @players["#Y2U2Q20G"],  5,    @players["#Q2RJGCJR"],    1,  41,   25,   0, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#Q2RJGCJR"],    1,  42,   9,    0, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def add_players_for_clan(clan)
          clan.players.each do |player|
            @players[player.coc_id] = player
          end
        end

        # data is assumed to be in the following format:
        # [ War, Attacker, "attacker_rank", Defender, "defender_rank", "destruction_percent", "minutes_left_in_war", "stars_awarded", "stars_earned" ]
        # [  0 ,    1     ,       2       ,     3   ,        4       ,           5          ,           6          ,        7       ,        8       ]
        def create_battle(data)
          puts "attempting battle creation for war_id '#{data[0].id}', attacker_id '#{data[1].id}', and defender_id '#{data[3].id}'"
          battle = Battle.where("war_id = ? AND attacker_id = ? AND defender_id = ?", data[0].id, data[1].id, data[3].id).first
          if battle.nil?
            battle = Battle.new(
              war: data[0], 
              attacker: data[1],
              attacker_rank: data[2],
              defender: data[3],
              defender_rank: data[4],
              destruction_percent: data[5],
              minutes_left_in_war: data[6],
              stars_awarded: data[7],
              stars_earned: data[8]
            )
            if battle.save
              puts "SUCCESS:  created battle of id '#{battle.id}'."
            else
              puts "FAILED:   did NOT CREATE battle with war coc_id '#{data[0].coc_id}' between attacker coc_id #{data[1].coc_id} and defender coc_id #{data[3].coc_id}."
              puts "Errors:   #{battle.errors.full_messages}."
            end
          else
            puts "WARNING:  battle with war coc_id '#{data[0].coc_id}' between attacker coc_id #{data[1].coc_id} and defender coc_id #{data[3].coc_id} already exists."
          end
        end


        def player_of_coc_id(coc_id)
          if @players[coc_id].present?
            @players[coc_id]
          else
            player = Player.find_by_coc_id(coc_id)
            @players[coc_id] = player
          end
        end

    end

  end
end

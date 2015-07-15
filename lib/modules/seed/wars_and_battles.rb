# You're looking at the Wars and Battles seed file.
module Seed
  class WarsAndBattles

    class << self

      def add_wars_and_their_battles
        @players = {}
        create_new_world_9_vs_pinkglove
        create_new_world_9_vs_los_payas_xxl
        create_new_world_9_vs_doguimie
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
          war = create_war("27/6/2015".to_date, new_world_9, pinkglove, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs pinkglove"
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


        def create_new_world_9_vs_los_payas_xxl
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          los_payas_xxl = Clan.find_by_coc_id("#CYQ0C8G")
          if new_world_9.nil? || los_payas_xxl.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and LOS PAY@S XXL ('#CYQ0C8G')"
            return
          end
          # the war
          war = create_war("4/7/2015".to_date, new_world_9, los_payas_xxl, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs los_payas_xxl"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(los_payas_xxl)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  15,   @players["#8CCUCP0"],   15, 79,   1436, 1, 1],
            [war, @players["#JJGGJQRV"],  12,   @players["#RCQ0J0JR"],  12, 32,   1434, 1, 1],
            [war, @players["#20GUUQR02"], 14,   @players["#P9VVGU9J"],  14, 83,   1431, 1, 1],
            [war, @players["#RCQ0J0JR"],  12,   @players["#JJGGJQRV"],  12, 100,  1429, 3, 3],
            [war, @players["#20P8QCQJY"], 2,    @players["#RVJ08JR2"],  2,  58,   1414, 1, 1],
            [war, @players["#JUUYQJJ2"],  6,    @players["#P9VVGU9J"],  14, 73,   1411, 1, 0],
            [war, @players["#8VGUCYQY"],  13,   @players["#9PQ2LV8L"],  13, 68,   1395, 2, 2],
            [war, @players["#9PQ2LV8L"],  13,   @players["#8VGUCYQY"],  13, 100,  1392, 3, 3],
            [war, @players["#G28VPUR"],   8,    @players["#JUUYQJJ2"],  6,  56,   1387, 2, 2],
            [war, @players["#8LYRQ8Y"],   4,    @players["#RV2YR0CC"],  7,  78,   1256, 1, 1],
            [war, @players["#9PQ2LV8L"],  13,   @players["#20GUUQR02"], 14, 100,  1250, 3, 3],
            [war, @players["#RCQ0J0JR"],  12,   @players["#2R8QQ8JG"],  10, 81,   1168, 1, 1],
            [war, @players["#G28VPUR"],   8,    @players["#Q09PJPLU"],  8,  56,   1152, 1, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#PVPQPLLJ"],  1,  25,   1129, 0, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#UJQRVYUV"],  9,  100,  1099, 0, 0],
            [war, @players["#P9VVGU9J"],  14,   @players["#Q09PJPLU"],  8,  50,   1098, 1, 0],
            [war, @players["#Q09PJPLU"],  8,    @players["#G28VPUR"],   8,  41,   848,  0, 0],
            [war, @players["#GY9YL809"],  10,   @players["#JG8RRP9Q"],  11, 73,   748,  1, 1],
            [war, @players["#UJQRVYUV"],  9,    @players["#YV2J2028"],  9,  44,   695,  0, 0],
            [war, @players["#Q09PJPLU"],  8,    @players["#L9QJ2JYQ"],  11, 50,   693,  1, 1],
            [war, @players["#8VGUCYQY"],  13,   @players["#RCQ0J0JR"],  12, 40,   641,  0, 0],
            [war, @players["#P02QQ89J"],  3,    @players["#LLVCLU2G"],  6,  51,   616,  2, 2],
            [war, @players["#20GUUQR02"], 14,   @players["#CPG2L0YV"],  15, 100,  563,  3, 3],
            [war, @players["#LLVCLU2G"],  6,    @players["#RV2YR0CC"],  7,  73,   527,  2, 1],
            [war, @players["#8LYRQ8Y"],   4,    @players["#2UQ2C2UQ"],  5,  73,   506,  2, 2],
            [war, @players["#Y2U2Q20G"],  5,    @players["#Q09PJPLU"],  8,  99,   495,  2, 1],
            [war, @players["#RVJ08JR2"],  2,    @players["#8R2Y0C9G"],  4,  67,   476,  2, 2],
            [war, @players["#PVPQPLLJ"],  1,    @players["#PQVUJ2PR"],  3,  41,   362,  1, 1],
            [war, @players["#RVJ08JR2"],  2,    @players["#P02QQ89J"],  3,  65,   346,  2, 2],
            [war, @players["#JJGGJQRV"],  12,   @players["#P9VVGU9J"],  14, 68,   320,  1, 0],
            [war, @players["#YV2J2028"],  9,    @players["#JG8RRP9Q"],  11, 80,   302,  2, 1],
            [war, @players["#20P8QCQJY"], 2,    @players["#8LYRQ8Y"],   4,  40,   282,  1, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#20P8QCQJY"], 2,  85,   234,  2, 2],
            [war, @players["#P9VVGU9J"],  14,   @players["#8CCUCP0"],   15, 48,   231,  0, 0],
            [war, @players["#Y2U2Q20G"],  5,    @players["#JUUYQJJ2"],  6,  100,  204,  3, 1],
            [war, @players["#8R2Y0C9G"],  4,    @players["#GY9YL809"],  10, 50,   152,  2, 2],
            [war, @players["#YV2J2028"],  9,    @players["#2R8QQ8JG"],  10, 66,   118,  1, 0],
            [war, @players["#L9QJ2JYQ"],  11,   @players["#2R8QQ8JG"],  10, 64,   115,  2, 1],
            [war, @players["#RV2YR0CC"],  7,    @players["#YV2J2028"],  9,  59,   108,  1, 1],
            [war, @players["#JG8RRP9Q"],  11,   @players["#P9VVGU9J"],  14, 42,   73,   0, 0],
            [war, @players["#2UQ2C2UQ"],  5,    @players["#P9VVGU9J"],  14, 100,  55,   3, 2],
            [war, @players["#8R2Y0C9G"],  4,    @players["#Y2U2Q20G"],  5,  60,   43,   2, 2],
            [war, @players["#GY9YL809"],  10,   @players["#8CCUCP0"],   15, 100,  33,   3, 2],
            [war, @players["#JUUYQJJ2"],  6,    @players["#RCQ0J0JR"],  12, 44,   25,   1, 0],
            [war, @players["#CPG2L0YV"],  15,   @players["#JJGGJQRV"],  12, 34,   24,   0, 0],
            [war, @players["#UJQRVYUV"],  9,    @players["#L9QJ2JYQ"],  11, 0,    24,   0, 0],
            [war, @players["#LLVCLU2G"],  6,    @players["#2R8QQ8JG"],  10, 98,   20,   2, 0],
            [war, @players["#RV2YR0CC"],  7,    @players["#G28VPUR"],   8,  56,   17,   1, 1],
            [war, @players["#JG8RRP9Q"],  11,   @players["#YV2J2028"],  9,  47,   15,   1, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#PVPQPLLJ"],  1,  54,   6,    1, 1],
            [war, @players["#P02QQ89J"],  3,    @players["#PV0LJJU0"],  7,  75,   3,    2, 2]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_doguimie
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          doguimie = Clan.find_by_coc_id("#8YGC2RRV")
          if new_world_9.nil? || doguimie.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and Doguimie ('#8YGC2RRV')"
            return
          end
          # the war
          war = create_war("11/7/2015".to_date, new_world_9, doguimie, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs doguimie"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(doguimie)
          # the battles, ordered by time, first to last.
          [ [war, @players["#29898Q2V"],  10, @players["#L9QJ2JYQ"],  12, 67,   1437, 2, 2],
            [war, @players["#Y080JGCG"],  13, @players["#9PQ2LV8L"],  13, 55,   1436, 1, 1],
            [war, @players["#CPG2L0YV"],  15, @players["#VRPJPRJU"],  15, 100,  1435, 3, 3],
            [war, @players["#PV0LJJU0"],  7,  @players["#Q80YJRU0"],  8,  77,   1430, 2, 2],
            [war, @players["#R9CVUCQY"],  1,  @players["#PQVUJ2PR"],  3,  4,    1415, 0, 0],
            [war, @players["#9PQ2LV8L"],  13, @players["#Y080JGCG"],  13, 57,   1311, 1, 1],
            [war, @players["#9PQ2LV8L"],  13, @players["#LQ8RGUPU"],  14, 100,  1151, 3, 3],
            [war, @players["#R20YLVUP"],  1,  @players["#R9CVUCQY"],  1,  52,   1086, 1, 1],
            [war, @players["#RCQ0J0JR"],  10, @players["#29898Q2V"],  10, 46,   1033, 0, 0],
            [war, @players["#8LYRQ8Y"],   4,  @players["#220QYUYCY"], 7,  80,   969,  2, 2],
            [war, @players["#G28VPUR"],   8,  @players["#GUR2PPYG"],  5,  50,   944,  1, 1],
            [war, @players["#YV2J2028"],  9,  @players["#PYCPC2LL"],  12, 84,   918,  2, 2],
            [war, @players["#Y080JGCG"],  13, @players["#P9VVGU9J"],  14, 73,   897,  1, 1],
            [war, @players["#9LG8YYCQ"],  3,  @players["#G28VPUR"],   8,  67,   842,  1, 1],
            [war, @players["#G2QCY90U"],  9,  @players["#9PQ2LV8L"],  13, 86,   835,  2, 1],
            [war, @players["#VRPJPRJU"],  15, @players["#CPG2L0YV"],  15, 100,  831,  3, 3],
            [war, @players["#RGUJVYYC"],  2,  @players["#Y2U2Q20G"],  5,  77,   821,  2, 2],
            [war, @players["#C0JJ2RJP"],  4,  @players["#G28VPUR"],   8,  54,   766,  1, 0],
            [war, @players["#PYCPC2LL"],  12, @players["#P9VVGU9J"],  14, 71,   757,  2, 1],
            [war, @players["#220QYUYCY"], 7,  @players["#YV2J2028"],  9,  29,   734,  0, 0],
            [war, @players["#LQ8RGUPU"],  14, @players["#P9VVGU9J"],  14, 63,   716,  1, 0],
            [war, @players["#2GCJJRYC"],  6,  @players["#LLVCLU2G"],  6,  79,   702,  2, 2],
            [war, @players["#CULQULUU"],  11, @players["#GY9YL809"],  11, 76,   650,  1, 1],
            [war, @players["#LLVCLU2G"],  6,  @players["#G2QCY90U"],  9,  48,   578,  1, 1],
            [war, @players["#PV0LJJU0"],  7,  @players["#29898Q2V"],  10, 52,   407,  1, 1],
            [war, @players["#8LYRQ8Y"],   4,  @players["#C0JJ2RJP"],  4,  64,   401,  2, 2],
            [war, @players["#VRPJPRJU"],  15, @players["#P9VVGU9J"],  14, 10,   359,  0, 0],
            [war, @players["#Y2U2Q20G"],  5,  @players["#GUR2PPYG"],  5,  73,   338,  2, 1],
            [war, @players["#RVJ08JR2"],  2,  @players["#RGUJVYYC"],  2,  78,   329,  2, 2],
            [war, @players["#GUR2PPYG"],  5,  @players["#PV0LJJU0"],  7,  68,   324,  2, 2],
            [war, @players["#PYCPC2LL"],  12, @players["#9PQ2LV8L"],  13, 72,   320,  2, 0],
            [war, @players["#CPG2L0YV"],  15, @players["#Y080JGCG"],  13, 40,   296,  0, 0],
            [war, @players["#29898Q2V"],  10, @players["#9PQ2LV8L"],  13, 100,  277,  3, 1],
            [war, @players["#9LG8YYCQ"],  3,  @players["#RCQ0J0JR"],  10, 95,   270,  2, 2],
            [war, @players["#PQVUJ2PR"],  3,  @players["#2GCJJRYC"],  6,  58,   252,  1, 1],
            [war, @players["#G2QCY90U"],  9,  @players["#YV2J2028"],  9,  61,   249,  1, 1],
            [war, @players["#220QYUYCY"], 7,  @players["#GY9YL809"],  11, 59,   244,  2, 1],
            [war, @players["#L9QJ2JYQ"],  12, @players["#Y080JGCG"],  13, 77,   243,  2, 1],
            [war, @players["#GUR2PPYG"],  5,  @players["#YV2J2028"],  9,  40,   212,  0, 0],
            [war, @players["#YV2J2028"],  9,  @players["#CULQULUU"],  11, 42,   204,  0, 0],
            [war, @players["#Y2U2Q20G"],  5,  @players["#G2QCY90U"],  9,  83,   179,  2, 1],
            [war, @players["#RCQ0J0JR"],  10, @players["#CULQULUU"],  11, 92,   151,  2, 2],
            [war, @players["#LLVCLU2G"],  6,  @players["#29898Q2V"],  10, 74,   144,  2, 1],
            [war, @players["#RVJ08JR2"],  2,  @players["#2GCJJRYC"],  6,  82,   132,  2, 1],
            [war, @players["#PQVUJ2PR"],  3,  @players["#PYCPC2LL"],  12, 81,   127,  2, 0],
            [war, @players["#GY9YL809"],  11, @players["#Y080JGCG"],  13, 100,  125,  3, 1],
            [war, @players["#Q80YJRU0"],  8,  @players["#YV2J2028"],  9,  43,   101,  1, 0],
            [war, @players["#R20YLVUP"],  1,  @players["#9LG8YYCQ"],  3,  82,   87,   2, 2],
            [war, @players["#GY9YL809"],  11, @players["#PYCPC2LL"],  12, 96,   60,   1, 0],
            [war, @players["#RGUJVYYC"],  2,  @players["#RVJ08JR2"],  2,  71,   56,   2, 2],
            [war, @players["#CULQULUU"],  11, @players["#YV2J2028"],  9,  57,   47,   1, 0],
            [war, @players["#C0JJ2RJP"],  4,  @players["#YV2J2028"],  9,  74,   40,   2, 1],
            [war, @players["#2GCJJRYC"],  6,  @players["#G28VPUR"],   8,  100,  38,   3, 2],
            [war, @players["#G28VPUR"],   8,  @players["#220QYUYCY"], 7,  50,   24,   1, 0],
            [war, @players["#R9CVUCQY"],  1,  @players["#R20YLVUP"],  1,  62,   15,   1, 1],
            [war, @players["#L9QJ2JYQ"],  12, @players["#PYCPC2LL"],  12, 57,   13,   2, 0],
            [war, @players["#Q80YJRU0"],  8,  @players["#P9VVGU9J"],  14, 89,   8,    2, 0]
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
          puts "---------------------"
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
              puts "FAILED:   did NOT CREATE battle with war id '#{data[0].id}' between attacker coc_id #{data[1].coc_id} and defender coc_id #{data[3].coc_id}."
              puts "Errors:   #{battle.errors.full_messages}."
            end
          else
            puts "IGNORING: battle with war id '#{data[0].id}' between attacker coc_id #{data[1].coc_id} and defender coc_id #{data[3].coc_id} already exists."
          end
          puts "---------------------"
        end


        def create_war(date, clan1, clan2, winning_clan=nil)
          # we didn't already make this, did we?
          wars = War.joins(:clans)
                    .where("wars.war_date = ? AND clans.id IN (?)", date, [ clan1.id, clan2.id ])
          existing_war_id = nil
          wars.map(&:id).sort.each do |war_id|
            if war_id == existing_war_id
              puts "IGNORING: war between these clans on this date already exists."
              return nil
            else
              existing_war_id = war_id
            end
          end
          # alrighty then
          war = War.new(war_date: date)
          clan_war_1 = ClanWar.create(war: war, clan: clan1, winner: clan1 == winning_clan)
          war.clan_wars << clan_war_1
          clan_war_2 = ClanWar.create(war: war, clan: clan2, winner: clan2 == winning_clan)
          war.clan_wars << clan_war_2
          if !war.save
            puts "WARNING:  war did not properly save, errors: #{war.errors.full_messages}"
            return nil
          end
          war
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

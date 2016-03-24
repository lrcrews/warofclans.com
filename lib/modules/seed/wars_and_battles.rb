# You're looking at the Wars and Battles seed file.
module Seed
  class WarsAndBattles

    class << self

      def add_wars_and_their_battles
        @players = {}
        # This is ordered by occurence (in case you were curious)
        create_new_world_9_vs_pinkglove
        create_new_world_9_vs_los_payas_xxl
        create_new_world_9_vs_doguimie
        create_new_world_9_vs_galaxyguardians
        # damn it, the three year anniversary patch removed us vs BLACKGHOST, 1 gem resource boost though, so I guess it's alright
        create_new_world_9_vs_heist
        create_new_world_9_vs_loscarecompleto
        create_new_world_9_vs_CLANprive
        # ya.. I was in Vancouver, which is not noramlly where I am, we did win though
        create_new_world_9_vs_The_trooper
        # holy hell, I missed us vs:
        #   - BetreutesZocken (W 25 18)
        #   - Prstg.Wrld.Wide (W 21 18)
        #   - Chaos Army (W 23 19)
        create_new_world_9_vs_Powers_That_Be
        create_new_world_9_vs_Lien_Minh_COC
        # it's just lazyness, really, we lost to Les Shuars, 23 26
        create_new_world_9_vs_Swiss_Keks
        create_new_world_9_vs_GOLD_n_SHOWERS
        create_new_world_9_vs_cep_2
        create_new_world_9_vs_les_chouquettes
        create_new_world_9_vs_Sons_of_hanover
        #create_new_world_9_vs_les_subprimes # well damn.
        create_new_world_9_vs_Meute_Des_Loups
        create_new_world_9_vs_Devils_Rejects
        create_new_world_9_vs_The_Roughnecks
        create_new_world_9_vs_The_Mustards
        create_new_werld_9_vs_game_of_rhones
        create_new_werld_9_vs_Elite_Hamburg
        create_new_world_9_vs_Rasht_Tick
        # sigh, didn't even think about last week until today, we lost to Wolf On Fire, 24 to 25
        create_new_world_9_vs_Purple_Savages
        create_new_world_9_vs_Belgium_at_war
        # we got beat, but it was a foreign clan with non-english stuff
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
          war = create_war("27/6/2015".to_date, 15, new_world_9, pinkglove, new_world_9)
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
          war = create_war("4/7/2015".to_date, 15, new_world_9, los_payas_xxl, new_world_9)
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
          war = create_war("11/7/2015".to_date, 15, new_world_9, doguimie, new_world_9)
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


        def create_new_world_9_vs_galaxyguardians
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          galaxyguardians = Clan.find_by_coc_id("#Y0QVU2YC")
          if new_world_9.nil? || galaxyguardians.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and galaxyguardians ('#Y0QVU2YC')"
            return
          end
          # the war
          war = create_war("18/7/2015".to_date, 10, new_world_9, galaxyguardians, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs galaxyguardians"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(galaxyguardians)
          # the battles, ordered by time, first to last.
          [ [war, @players["#8LYRQ8Y"],   4,    @players["#LYPQPLR8"],    6,  87,   1376, 2, 2],
            [war, @players["#9VGLVGGY"],  8,    @players["#9PQ2LV8L"],    9,  72,   1375, 2, 2],
            [war, @players["#YGL0G2VQ"],  1,    @players["#PQVUJ2PR"],    3,  46,   1373, 0, 0],
            [war, @players["#CPG2L0YV"],  10,   @players["#R2RL0LJ0"],    10, 55,   1373, 1, 1],
            [war, @players["#RCQ0J0JR"],  8,    @players["#9VGLVGGY"],    8,  100,  1306, 3, 3],
            [war, @players["#8LYRQ8Y"],   4,    @players["#R2GL8VCQ"],    5,  99,   1272, 2, 2],
            [war, @players["#J80R8GGU"],  4,    @players["#Y2U2Q20G"],    5,  36,   1264, 0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#L80J8UPG"],    2,  77,   1188, 2, 2],
            [war, @players["#Y2U2Q20G"],  5,    @players["#YGL0G2VQ"],    1,  43,   989,  0, 0],
            [war, @players["#RCQ0J0JR"],  8,    @players["#PPVJ008Y"],    9,  100,  861,  3, 3],
            [war, @players["#LLVCLU2G"],  6,    @players["#YPPQCQYQ"],    7,  100,  734,  3, 3],
            [war, @players["#R2GL8VCQ"],  5,    @players["#LLVCLU2G"],    6,  52,   450,  1, 1],
            [war, @players["#9VGLVGGY"],  8,    @players["#CPG2L0YV"],    10, 100,  422,  3, 3],
            [war, @players["#PPVJ008Y"],  9,    @players["#RCQ0J0JR"],    8,  34,   404,  0, 0],
            [war, @players["#G28VPUR"],   7,    @players["#J80R8GGU"],    4,  87,   364,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#J80R8GGU"],    4,  100,  318,  3, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#9QRVY2V8"],    3,  95,   257,  2, 2],
            [war, @players["#CPG2L0YV"],  10,   @players["#PPVJ008Y"],    9,  40,   232,  0, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#R2GL8VCQ"],    5,  79,   207,  2, 0],
            [war, @players["#RVJ08JR2"],  2,    @players["#YGL0G2VQ"],    1,  54,   170,  1, 1],
            [war, @players["#9PQ2LV8L"],  9,    @players["#R2RL0LJ0"],    10, 100,  144,  3, 2],
            [war, @players["#Y2U2Q20G"],  5,    @players["#R2GL8VCQ"],    5,  100,  124,  3, 1],
            [war, @players["#LLVCLU2G"],  6,    @players["#LYPQPLR8"],    6,  63,   48,   2, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#YGL0G2VQ"],    1,  46,   36,   0, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_heist
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          heist = Clan.find_by_coc_id("#8QG0G9P0")
          if new_world_9.nil? || heist.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and heist ('#8QG0G9P0')"
            return
          end
          # the war
          war = create_war("1/8/2015".to_date, 15, new_world_9, heist, heist)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs heist"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(heist)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPY2P0Y2"],  5,    @players["#Y2U2Q20G"],    5,  44,   1438, 0, 0],
            [war, @players["#PP0JQUYR"],  15,   @players["#CPG2L0YV"],    15, 100,  1420, 3, 3],
            [war, @players["#GQQ8VVVU"],  13,   @players["#P9VVGU9J"],    13, 83,   1400, 2, 2],
            [war, @players["#2L82U9YQ"],  1,    @players["#R20YLVUP"],    1,  50,   1398, 1, 1],
            [war, @players["#8PV2J92G"],  11,   @players["#L9QJ2JYQ"],    11, 71,   1391, 2, 2],
            [war, @players["#98PU82UP"],  14,   @players["#22Q2L92V2"],   14, 46,   1381, 0, 0],
            [war, @players["#GCLQGQGC"],  2,    @players["#8Y2V2Q09"],    2,  39,   1359, 0, 0],
            [war, @players["#2899UVCJ"],  6,    @players["#LLVCLU2G"],    6,  67,   1334, 2, 2],
            [war, @players["#9PQ2LV8L"],  12,   @players["#2CQPJG2C"],    12, 37,   1306, 0, 0],
            [war, @players["#JR8298PJ"],  8,    @players["#PV0LJJU0"],    8,  58,   1302, 1, 1],
            [war, @players["#PP0JQUYR"],  15,   @players["#22Q2L92V2"],   14, 68,   1299, 2, 2],
            [war, @players["#YL0R29G9"],  7,    @players["#G28VPUR"],     7,  100,  1283, 3, 3],
            [war, @players["#GQQ8VVVU"],  13,   @players["#9PQ2LV8L"],    12, 50,   1235, 1, 1],
            [war, @players["#Y2U2Q20G"],  5,    @players["#JR8298PJ"],    8,  58,   1221, 1, 1],
            [war, @players["#RCQ0J0JR"],  10,   @players["#2GR800RV"],    10, 59,   1142, 2, 2],
            [war, @players["#LLVCLU2G"],  6,    @players["#C22C8LVL"],    9,  67,   1044, 2, 2],
            [war, @players["#9PQ2LV8L"],  12,   @players["#98PU82UP"],    14, 100,  985,  3, 3],
            [war, @players["#CPG2L0YV"],  15,   @players["#PP0JQUYR"],    15, 74,   973,  2, 2],
            [war, @players["#PQVUJ2PR"],  4,    @players["#8PV2J92G"],    11, 65,   816,  2, 2],
            [war, @players["#C22C8LVL"],  9,    @players["#YV2J2028"],    9,  55,   787,  1, 1],
            [war, @players["#RCQ0J0JR"],  10,   @players["#GQQ8VVVU"],    13, 100,  748,  3, 3],
            [war, @players["#2GR800RV"],  10,   @players["#RCQ0J0JR"],    10, 58,   707,  2, 2],
            [war, @players["#C22C8LVL"],  9,    @players["#Y2U2Q20G"],    5,  69,   693,  2, 2],
            [war, @players["#8PV2J92G"],  11,   @players["#9PQ2LV8L"],    12, 82,   685,  1, 0],
            [war, @players["#2L82U9YQ"],  1,    @players["#PQVUJ2PR"],    4,  69,   649,  2, 2],
            [war, @players["#GCLQGQGC"],  2,    @players["#9PQ2LV8L"],    12, 100,  576,  3, 2],
            [war, @players["#Y2U2Q20G"],  5,    @players["#CPY2P0Y2"],    5,  72,   447,  2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#RUPY9RCU"],    3,  35,   399,  1, 1],
            [war, @players["#YL0R29G9"],  7,    @players["#PV0LJJU0"],    8,  100,  398,  3, 2],
            [war, @players["#JR8298PJ"],  8,    @players["#P9VVGU9J"],    13, 100,  394,  3, 1],
            [war, @players["#RVJ08JR2"],  3,    @players["#GCLQGQGC"],    2,  33,   387,  0, 0],
            [war, @players["#2CQPJG2C"],  12,   @players["#YV2J2028"],    9,  66,   310,  1, 0],
            [war, @players["#PV0LJJU0"],  8,    @players["#2899UVCJ"],    6,  48,   308,  0, 0],
            [war, @players["#RVJ08JR2"],  3,    @players["#2899UVCJ"],    6,  54,   293,  2, 2],
            [war, @players["#PV0LJJU0"],  8,    @players["#YC0JRGJU"],    4,  42,   263,  0, 0],
            [war, @players["#2899UVCJ"],  6,    @players["#YV2J2028"],    9,  29,   251,  0, 0],
            [war, @players["#CPG2L0YV"],  15,   @players["#2CQPJG2C"],    12, 33,   239,  0, 0],
            [war, @players["#PQVUJ2PR"],  4,    @players["#2CQPJG2C"],    12, 63,   223,  2, 2],
            [war, @players["#98PU82UP"],  14,   @players["#YV2J2028"],    9,  20,   213,  0, 0],
            [war, @players["#YC0JRGJU"],  4,    @players["#YV2J2028"],    9,  32,   196,  0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#YC0JRGJU"],    4,  100,  184,  3, 3],
            [war, @players["#CPY2P0Y2"],  5,    @players["#YV2J2028"],    9,  65,   173,  1, 0],
            [war, @players["#LLVCLU2G"],  6,    @players["#YL0R29G9"],    7,  52,   156,  1, 1],
            [war, @players["#L9QJ2JYQ"],  11,   @players["#PP0JQUYR"],    15, 100,  143,  3, 1],
            [war, @players["#2GR800RV"],  10,   @players["#22Q2L92V2"],   14, 100,  136,  3, 1],
            [war, @players["#YC0JRGJU"],  4,    @players["#L9QJ2JYQ"],    11, 76,   117,  2, 0],
            [war, @players["#RUPY9RCU"],  3,    @players["#L9QJ2JYQ"],    11, 74,   62,   1, 0],
            [war, @players["#L9QJ2JYQ"],  11,   @players["#2CQPJG2C"],    12, 48,   6,    0, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_loscarecompleto
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          loscarecompleto = Clan.find_by_coc_id("#P9UVQ0Y")
          if new_world_9.nil? || loscarecompleto.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and loscarecompleto ('#P9UVQ0Y')"
            return
          end
          # the war
          war = create_war("8/8/2015".to_date, 10, new_world_9, loscarecompleto, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs loscarecompleto"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(loscarecompleto)
          # the battles, ordered by time, first to last.
          [ [war, @players["#9PQ2LV8L"],  9,    @players["#2LRUUU9V0"],   9,  85,   1422, 2, 2],
            [war, @players["#2LRUUU9V0"], 9,    @players["#9PQ2LV8L"],    9,  59,   1389, 1, 1],
            [war, @players["#PV0LJJU0"],  7,    @players["#9U82R928"],    7,  99,   1376, 2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#LQ990VRJ"],    1,  61,   1345, 2, 2],
            [war, @players["#Y2U2Q20G"],  4,    @players["#LC2VJQ8U"],    6,  76,   1335, 1, 1],
            [war, @players["#9PQ2LV8L"],  9,    @players["#UUC9PC8U"],    10, 100,  1328, 3, 3],
            [war, @players["#2LRUUU9V0"], 9,    @players["#9GRJQV82"],    10, 100,  1310, 3, 3],
            [war, @players["#LC2VJQ8U"],  6,    @players["#G28VPUR"],     6,  91,   1310, 2, 2],
            [war, @players["#RCQ0J0JR"],  8,    @players["#LJRCPCVV"],    8,  100,  1310, 3, 3],
            [war, @players["#G28VPUR"],   6,    @players["#G2YCCJ9R"],    5,  49,   1190, 0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#8RY0YCRQ"],    2,  100,  1181, 3, 3],
            [war, @players["#2PQCJVUL"],  4,    @players["#Y2U2Q20G"],    4,  40,   1115, 0, 0],
            [war, @players["#LQ990VRJ"],  1,    @players["#RVJ08JR2"],    2,  75,   1038, 2, 2],
            [war, @players["#9GRJQV82"],  10,   @players["#2LRUUU9V0"],   9,  71,   1031, 1, 0],
            [war, @players["#Y2U2Q20G"],  4,    @players["#G2YCCJ9R"],    5,  53,   484,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#2PQCJVUL"],    4,  100,  457,  3, 3],
            [war, @players["#L8V8PJG"],   3,    @players["#PQVUJ2PR"],    3,  65,   419,  2, 2],
            [war, @players["#UUC9PC8U"],  10,   @players["#9PQ2LV8L"],    9,  72,   418,  2, 1],
            [war, @players["#LJRCPCVV"],  8,    @players["#RCQ0J0JR"],    8,  72,   374,  2, 2],
            [war, @players["#G2YCCJ9R"],  5,    @players["#LLVCLU2G"],    5,  68,   363,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#L8V8PJG"],     3,  54,   352,  2, 2],
            [war, @players["#8RY0YCRQ"],  2,    @players["#PV0LJJU0"],    7,  73,   335,  2, 2],
            [war, @players["#LC2VJQ8U"],  6,    @players["#9PQ2LV8L"],    9,  100,  304,  3, 1],
            [war, @players["#9U82R928"],  7,    @players["#RCQ0J0JR"],    8,  68,   264,  2, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#2LRUUU9V0"],   9,  100,  255,  3, 1],
            [war, @players["#LJRCPCVV"],  8,    @players["#Y2U2Q20G"],    4,  54,   234,  2, 2],
            [war, @players["#PV0LJJU0"],  7,    @players["#LC2VJQ8U"],    6,  58,   225,  2, 1],
            [war, @players["#8RY0YCRQ"],  2,    @players["#RCQ0J0JR"],    8,  68,   156,  1, 0],
            [war, @players["#LLVCLU2G"],  5,    @players["#G2YCCJ9R"],    5,  75,   155,  2, 0],
            [war, @players["#G28VPUR"],   6,    @players["#LC2VJQ8U"],    6,  38,   147,  0, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#9U82R928"],    7,  77,   145,  2, 0],
            [war, @players["#9U82R928"],  7,    @players["#PV0LJJU0"],    7,  57,   125,  2, 0],
            [war, @players["#LQ990VRJ"],  1,    @players["#R20YLVUP"],    1,  63,   68,   1, 1],
            [war, @players["#RCQ0J0JR"],  8,    @players["#9U82R928"],    7,  100,  65,   3, 1],
            [war, @players["#G2YCCJ9R"],  5,    @players["#RCQ0J0JR"],    8,  94,   50,   2, 0],
            [war, @players["#UUC9PC8U"],  10,   @players["#9GRJQV82"],    10, 82,   44,   1, 0],
            [war, @players["#LLVCLU2G"],  5,    @players["#LC2VJQ8U"],    6,  82,   29,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_CLANprive
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          clanprive = Clan.find_by_coc_id("#PYCCJJUC")
          if new_world_9.nil? || clanprive.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and clanprive ('#PYCCJJUC')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("15/8/2015".to_date, 10, new_world_9, clanprive, clanprive)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs clanprive"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(clanprive)
          # the battles, ordered by time, first to last.
          [ [war, @players["#RCQ0J0JR"],  7,    @players["#Y0VYVYCV"],  7,  68,   1413, 2, 2],
            [war, @players["#LLVCLU2G"],  4,    @players["#80JJY2Q0"],  4,  54,   1010, 1, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#QLCY2GL9"],  1,  52,   952,  2, 2],
            [war, @players["#L9QJ2JYQ"],  8,    @players["#P9CCCRLY"],  10, 54,   948,  1, 1],
            [war, @players["#GY9YL809"],  9,    @players["#U8JVLRVC"],  9,  56,   933,  1, 1],
            [war, @players["#22CUJCQ8"],  6,    @players["#PV0LJJU0"],  6,  72,   648,  2, 2],
            [war, @players["#P9CCCRLY"],  10,   @players["#9GRJQV82"],  10, 94,   647,  2, 2],
            [war, @players["#J8Q9QU8P"],  8,    @players["#GY9YL809"],  9,  68,   616,  2, 2],
            [war, @players["#JJ8YCGQC"],  5,    @players["#G28VPUR"],   5,  86,   614,  2, 2],
            [war, @players["#LPCRCR0L"],  2,    @players["#LLVCLU2G"],  4,  42,   583,  1, 1],
            [war, @players["#U8JVLRVC"],  9,    @players["#L9QJ2JYQ"],  8,  100,  473,  3, 3],
            [war, @players["#QLCY2GL9"],  1,    @players["#R20YLVUP"],  1,  49,   463,  1, 1],
            [war, @players["#LPCRCR0L"],  2,    @players["#RCQ0J0JR"],  7,  62,   437,  2, 2],
            [war, @players["#G8J0JGRR"],  3,    @players["#Y2U2Q20G"],  3,  77,   409,  2, 2],
            [war, @players["#Y0VYVYCV"],  7,    @players["#LLVCLU2G"],  4,  88,   407,  2, 1],
            [war, @players["#Y2U2Q20G"],  3,    @players["#JJ8YCGQC"],  5,  64,   387,  2, 2],
            [war, @players["#9GRJQV82"],  10,   @players["#P9CCCRLY"],  10, 56,   353,  1, 0],
            [war, @players["#80JJY2Q0"],  4,    @players["#LLVCLU2G"],  4,  100,  332,  3, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#80JJY2Q0"],  4,  66,   308,  2, 1],
            [war, @players["#22CUJCQ8"],  6,    @players["#RCQ0J0JR"],  7,  84,   266,  2, 0],
            [war, @players["#RVJ08JR2"],  2,    @players["#LPCRCR0L"],  2,  100,  263,  3, 3],
            [war, @players["#JJ8YCGQC"],  5,    @players["#PV0LJJU0"],  6,  90,   208,  2, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#J8Q9QU8P"],  8,  77,   200,  2, 2],
            [war, @players["#QLCY2GL9"],  1,    @players["#RVJ08JR2"],  2,  91,   184,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#G8J0JGRR"],  3,  57,   176,  2, 2],
            [war, @players["#80JJY2Q0"],  4,    @players["#G28VPUR"],   5,  100,  161,  3, 1],
            [war, @players["#U8JVLRVC"],  9,    @players["#GY9YL809"],  9,  98,   149,  2, 0],
            [war, @players["#Y0VYVYCV"],  7,    @players["#9GRJQV82"],  10, 100,  135,  3, 1],
            [war, @players["#P9CCCRLY"],  10,   @players["#GY9YL809"],  9,  52,   108,  2, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#22CUJCQ8"],  6,  52,   91,   1, 1],
            [war, @players["#G8J0JGRR"],  3,    @players["#PV0LJJU0"],  6,  100,  56,   3, 1],
            [war, @players["#GY9YL809"],  9,    @players["#P9CCCRLY"],  10, 100,  52,   3, 2],
            [war, @players["#J8Q9QU8P"],  8,    @players["#RCQ0J0JR"],  7,  74,   21,   1, 0],
            [war, @players["#RCQ0J0JR"],  7,    @players["#U8JVLRVC"],  9,  74,   13,   2, 1],
            [war, @players["#Y2U2Q20G"],  3,    @players["#22CUJCQ8"],  6,  70,   9,    2, 1]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_The_trooper
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          the_trooper = Clan.find_by_coc_id("#PGG2R0JY")
          if new_world_9.nil? || the_trooper.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and the_trooper ('#PGG2R0JY')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("29/8/2015".to_date, 10, new_world_9, the_trooper, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs the_trooper"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(the_trooper)
          # the battles, ordered by time, first to last.
          [ [war, @players["#9PQ2LV8L"],  10,   @players["#28RGGYGJ8"],   10,   66,   1431, 1, 1],
            [war, @players["#8U2QVUPP"],  9,    @players["#RCQ0J0JR"],    9,    58,   1418, 2, 2],
            [war, @players["#RCQ0J0JR"],  9,    @players["#8U2QVUPP"],    9,    75,   1397, 2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#2PVJJYRC"],    3,    52,   1386, 1, 1],
            [war, @players["#LJ8899Y0"],  8,    @players["#L9QJ2JYQ"],    8,    40,   1367, 0, 0],
            [war, @players["#V0ULJ80"],   2,    @players["#RVJ08JR2"],    2,    57,   1361, 2, 2],
            [war, @players["#9GGLJJ"],    1,    @players["#R20YLVUP"],    1,    49,   1345, 0, 0],
            [war, @players["#9PQ2LV8L"],  10,   @players["#LJ8899Y0"],    8,    44,   1329, 0, 0],
            [war, @players["#RVJ08JR2"],  2,    @players["#LCCG9CJV"],    4,    100,  1288, 3, 3],
            [war, @players["#PQVUJ2PR"],  3,    @players["#G0U20U2"],     7,    39,   1278, 0, 0],
            [war, @players["#8U2QVUPP"],  9,    @players["#L9QJ2JYQ"],    8,    60,   1191, 1, 1],
            [war, @players["#V0ULJ80"],   2,    @players["#R20YLVUP"],    1,    41,   1185, 0, 0],
            [war, @players["#28RGGYGJ8"], 10,   @players["#9PQ2LV8L"],    10,   75,   922,  2, 2],
            [war, @players["#28RGGYGJ8"], 10,   @players["#L9QJ2JYQ"],    8,    50,   695,  1, 0],
            [war, @players["#RCQ0J0JR"],  9,    @players["#LJ8899Y0"],    8,    56,   652,  1, 1],
            [war, @players["#PVCP0JYC"],  5,    @players["#LLVCLU2G"],    5,    82,   599,  1, 1],
            [war, @players["#92P0JQY2"],  6,    @players["#G28VPUR"],     6,    70,   594,  2, 2],
            [war, @players["#LJ8899Y0"],  8,    @players["#9PQ2LV8L"],    10,   100,  565,  3, 1],
            [war, @players["#G0U20U2"],   7,    @players["#PV0LJJU0"],    7,    74,   508,  2, 2]
            # Damn... didn't finish this in time.  Eh, eff it, I'm leaving it in half done for now.
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Powers_That_Be
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          powers_that_be = Clan.find_by_coc_id("#PRP2LJP")
          if new_world_9.nil? || powers_that_be.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and powers_that_be ('#PRP2LJP')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("26/9/2015".to_date, 10, new_world_9, powers_that_be, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs powers_that_be"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(powers_that_be)
          # the battles, ordered by time, first to last.
          [ [war, @players["#R20YLVUP"],  2,    @players["#PU0L8U09"],    2,    38,   1400, 1, 1],
            [war, @players["#2RQ9P2YJ"],  9,    @players["#CPG2L0YV"],    10,   100,  1280, 3, 3],
            [war, @players["#9PQ2LV8L"],  8,    @players["#2RQ9P2YJ"],    9,    100,  1257, 3, 3],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#L2JPV0GV"],    7,    42,   1247, 0, 0],
            [war, @players["#8LPLRJR9"],  4,    @players["#LLVCLU2G"],    5,    58,   1225, 2, 2],
            [war, @players["#2RQ9P2YJ"],  9,    @players["#9GRJQV82"],    9,    64,   1205, 1, 1],
            [war, @players["#28GYQYL2P"], 10,   @players["#9GRJQV82"],    9,    57,   1127, 2, 1],
            [war, @players["#L2JPV0GV"],  7,    @players["#9PQ2LV8L"],    8,    57,   1035, 1, 1],
            [war, @players["#8LPLRJR9"],  4,    @players["#L9QJ2JYQ"],    4,    46,   790,  1, 1],
            [war, @players["#JUQUJQJR"],  3,    @players["#Y2U2Q20G"],    3,    47,   692,  0, 0],
            [war, @players["#Y2U2Q20G"],  3,    @players["#8LPLRJR9"],    4,    66,   665,  2, 2],
            [war, @players["#RVJ08JR2"],  1,    @players["#JUQUJQJR"],    3,    83,   583,  2, 2],
            [war, @players["#9GRJQV82"],  9,    @players["#28GYQYL2P"],   10,   90,   544,  2, 2],
            [war, @players["#R20YLVUP"],  2,    @players["#L8VVVCU"],     1,    50,   524,  2, 2],
            [war, @players["#L8VVVCU"],   1,    @players["#RVJ08JR2"],    1,    58,   516,  1, 1],
            [war, @players["#2G0V0URG"],  6,    @players["#PV0LJJU0"],    6,    49,   507,  0, 0],
            [war, @players["#RVJ08JR2"],  1,    @players["#PU0L8U09"],    2,    47,   475,  0, 0],
            [war, @players["#9PQ2LV8L"],  8,    @players["#CQUPV88Q"],    8,    46,   465,  1, 1],
            [war, @players["#L2JPV0GV"],  7,    @players["#RCQ0J0JR"],    7,    63,   463,  2, 2],
            [war, @players["#28GYQYL2P"], 10,   @players["#9PQ2LV8L"],    8,    32,   445,  0, 0],
            [war, @players["#CPG2L0YV"],  10,   @players["#28GYQYL2P"],   10,   79,   402,  1, 0],
            [war, @players["#LLVCLU2G"],  5,    @players["#9UQ8VUVY"],    5,    94,   386,  2, 2],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#CQUPV88Q"],    8,    54,   355,  1, 0],
            [war, @players["#PU0L8U09"],  2,    @players["#Y2U2Q20G"],    3,    77,   305,  1, 1],
            [war, @players["#RCQ0J0JR"],  7,    @players["#L2JPV0GV"],    7,    62,   293,  2, 2],
            [war, @players["#PV0LJJU0"],  6,    @players["#2G0V0URG"],    6,    86,   269,  2, 2],
            [war, @players["#RCQ0J0JR"],  7,    @players["#CQUPV88Q"],    8,    81,   145,  2, 1],
            [war, @players["#9UQ8VUVY"],  5,    @players["#9PQ2LV8L"],    8,    59,   111,  2, 1],
            [war, @players["#9GRJQV82"],  9,    @players["#2RQ9P2YJ"],    9,    100,  103,  3, 0],
            [war, @players["#CQUPV88Q"],  8,    @players["#9GRJQV82"],    9,    100,  102,  3, 1],
            [war, @players["#CQUPV88Q"],  8,    @players["#PV0LJJU0"],    6,    75,   82,   1, 1],
            [war, @players["#JUQUJQJR"],  3,    @players["#PV0LJJU0"],    6,    57,   69,   1, 0],
            [war, @players["#L8VVVCU"],   1,    @players["#L9QJ2JYQ"],    4,    98,   65,   2, 1],
            [war, @players["#2G0V0URG"],  6,    @players["#9PQ2LV8L"],    8,    40,   43,   1, 0],
            [war, @players["#PU0L8U09"],  2,    @players["#R20YLVUP"],    2,    39,   27,   0, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#8LPLRJR9"],    4,    62,   16,   2, 0],
            [war, @players["#LLVCLU2G"],  5,    @players["#2G0V0URG"],    6,    100,  12,   3, 1],
            [war, @players["#Y2U2Q20G"],  3,    @players["#JUQUJQJR"],    3,    59,   7,    2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Lien_Minh_COC
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          lien_minh_coc = Clan.find_by_coc_id("#2VCLRR2U")
          if new_world_9.nil? || lien_minh_coc.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and lien_minh_coc ('#2VCLRR2U')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("3/10/2015".to_date, 10, new_world_9, lien_minh_coc, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs lien_minh_coc"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(lien_minh_coc)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  10,   @players["#2P9VQ9PYJ"],   10,   93,   1429, 2, 2],
            [war, @players["#9GRJQV82"],  9,    @players["#29GR0PLLJ"],   9,    70,   1109, 1, 1],
            [war, @players["#PJ8PGY0"],   2,    @players["#PQVUJ2PR"],    3,    85,   1086, 2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#JJ0UGLGQ"],    4,    90,   1072, 2, 2],
            [war, @players["#CP889L0R"],  6,    @players["#PV0LJJU0"],    6,    60,   1070, 1, 1],
            [war, @players["#LLVCLU2G"],  5,    @players["#JVPURRYC"],    5,    63,   1027, 2, 2],
            [war, @players["#9PQ2LV8L"],  8,    @players["#29GR0PLLJ"],   9,    96,   1003, 2, 1],
            [war, @players["#Y2U2Q20G"],  4,    @players["#CP889L0R"],    6,    66,   985,  2, 2],
            [war, @players["#CP889L0R"],  6,    @players["#LLVCLU2G"],    5,    54,   966,  2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#PJ8PGY0"],     2,    81,   927,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#U2UR208L"],    3,    90,   918,  2, 2],
            [war, @players["#8UJJ2P20"],  8,    @players["#9PQ2LV8L"],    8,    40,   885,  1, 1],
            [war, @players["#U2UR208L"],  3,    @players["#PV0LJJU0"],    6,    68,   853,  2, 1],
            [war, @players["#8UJJ2P20"],  8,    @players["#9GRJQV82"],    9,    100,  817,  3, 3],
            [war, @players["#9GRJQV82"],  9,    @players["#2P9VQ9PYJ"],   10,   100,  776,  3, 1],
            [war, @players["#CYLRJJVC"],  7,    @players["#9PQ2LV8L"],    8,    82,   746,  2, 1],
            [war, @players["#JVPURRYC"],  5,    @players["#9PQ2LV8L"],    8,    100,  740,  3, 1],
            [war, @players["#RCQ0J0JR"],  7,    @players["#8UJJ2P20"],    8,    100,  716,  3, 3],
            [war, @players["#29GR0PLLJ"], 9,    @players["#CPG2L0YV"],    10,   100,  713,  3, 3],
            [war, @players["#29GR0PLLJ"], 9,    @players["#RCQ0J0JR"],    7,    50,   591,  1, 1],
            [war, @players["#UYY8GCQ2"],  1,    @players["#Y2U2Q20G"],    4,    50,   521,  1, 1],
            [war, @players["#U2UR208L"],  3,    @players["#RCQ0J0JR"],    7,    87,   335,  2, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#CYLRJJVC"],    7,    42,   276,  1, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#UYY8GCQ2"],    1,    61,   269,  2, 2],
            [war, @players["#PV0LJJU0"],  6,    @players["#CYLRJJVC"],    7,    100,  245,  3, 2],
            [war, @players["#CYLRJJVC"],  7,    @players["#R20YLVUP"],    1,    56,   245,  1, 1],
            [war, @players["#JVPURRYC"],  5,    @players["#PV0LJJU0"],    6,    100,  241,  3, 1],
            [war, @players["#Y2U2Q20G"],  4,    @players["#JVPURRYC"],    5,    84,   234,  2, 0],
            [war, @players["#UYY8GCQ2"],  1,    @players["#RVJ08JR2"],    2,    29,   228,  1, 1],
            [war, @players["#CPG2L0YV"],  10,   @players["#29GR0PLLJ"],   9,    48,   227,  0, 0],
            [war, @players["#PJ8PGY0"],   2,    @players["#Y2U2Q20G"],    4,    81,   193,  2, 1],
            [war, @players["#JJ0UGLGQ"],  4,    @players["#RCQ0J0JR"],    7,    50,   189,  1, 0],
            [war, @players["#2P9VQ9PYJ"], 10,   @players["#CPG2L0YV"],    10,   100,  164,  3, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#29GR0PLLJ"],   9,    100,  84,   3, 1],
            [war, @players["#RCQ0J0JR"],  7,    @players["#CP889L0R"],    6,    60,   41,   2, 0],
            [war, @players["#LLVCLU2G"],  5,    @players["#JJ0UGLGQ"],    4,    64,   38,   2, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#CP889L0R"],    6,    60,   16,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Swiss_Keks
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          swiss_keks = Clan.find_by_coc_id("#2VRU2V0L")
          if new_world_9.nil? || swiss_keks.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and swiss_keks ('#2VRU2V0L')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("17/10/2015".to_date, 10, new_world_9, swiss_keks, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs swiss_keks"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(swiss_keks)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  10,   @players["#209PYJJCP"],   10,   100,  1436, 3, 3],
            [war, @players["#UCR89YQ8"],  5,    @players["#9GRJQV82"],    9,    100,  1392, 3, 3],
            [war, @players["#209PYJJCP"], 10,   @players["#CPG2L0YV"],    10,   45,   1373, 0, 0],
            [war, @players["#9GRJQV82"],  9,    @players["#UP8P2LVY"],    9,    96,   1338, 2, 2],
            [war, @players["#9PQ2LV8L"],  8,    @players["#VY2CQJ02"],    8,    93,   1334, 2, 2],
            [war, @players["#UCR89YQ8"],  5,    @players["#CPG2L0YV"],    10,   100,  1294, 3, 3],
            [war, @players["#R20YLVUP"],  1,    @players["#JL0L08VY"],    2,    42,   1243, 2, 0],
            [war, @players["#CPG2L0YV"],  10,   @players["#UP8P2LVY"],    9,    70,   1111, 2, 0],
            [war, @players["#RCQ0J0JR"],  4,    @players["#CCJY88VC"],    4,    66,   1041, 2, 2],
            [war, @players["#9PQ2LV8L"],  8,    @players["#UP8P2LVY"],    9,    100,  1030, 3, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#2CJC29YQ"],    1,    29,   1022, 1, 1],
            [war, @players["#UP8P2LVY"],  9,    @players["#9PQ2LV8L"],    8,    9,    1021, 1, 1],
            [war, @players["#LLVCLU2G"],  6,    @players["#989Q0GP"],     6,    100,  997,  3, 3],
            [war, @players["#G28VPUR"],   7,    @players["#UCR89YQ8"],    5,    62,   863,  1, 1],
            [war, @players["#VY2CQJ02"],  8,    @players["#9PQ2LV8L"],    8,    45,   791,  0, 0],
            [war, @players["#JL0L08VY"],  2,    @players["#Y2U2Q20G"],    3,    100,  756,  3, 3],
            [war, @players["#989Q0GP"],   6,    @players["#G28VPUR"],     7,    32,   689,  1, 1],
            [war, @players["#CCJY88VC"],  4,    @players["#G28VPUR"],     7,    59,   618,  2, 1],
            [war, @players["#2CJC29YQ"],  1,    @players["#R20YLVUP"],    1,    55,   614,  1, 1],
            [war, @players["#CCJY88VC"],  4,    @players["#9PQ2LV8L"],    8,    65,   586,  1, 0],
            [war, @players["#JL0L08VY"],  2,    @players["#RVJ08JR2"],    2,    49,   582,  0, 0],
            [war, @players["#2U20Q9YQ"],  3,    @players["#LLVCLU2G"],    6,    100,  510,  3, 3],
            [war, @players["#QQCGR2QY"],  7,    @players["#9PQ2LV8L"],    8,    56,   489,  2, 1],
            [war, @players["#QQCGR2QY"],  7,    @players["#RCQ0J0JR"],    4,    63,   334,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#JL0L08VY"],    2,    49,   316,  0, 0],
            [war, @players["#Y2U2Q20G"],  3,    @players["#CCJY88VC"],    4,    100,  300,  3, 1],
            [war, @players["#LLVCLU2G"],  6,    @players["#QQCGR2QY"],    7,    100,  298,  3, 3],
            [war, @players["#RVJ08JR2"],  2,    @players["#2U20Q9YQ"],    3,    100,  223,  3, 3],
            [war, @players["#PV0LJJU0"],  5,    @players["#UCR89YQ8"],    5,    100,  178,  3, 2],
            [war, @players["#2U20Q9YQ"],  3,    @players["#PV0LJJU0"],    5,    66,   130,  2, 2],
            [war, @players["#RCQ0J0JR"],  4,    @players["#VY2CQJ02"],    8,    100,  75,   3, 1],
            [war, @players["#209PYJJCP"], 10,   @players["#9PQ2LV8L"],    8,    22,   70,   0, 0],
            [war, @players["#2CJC29YQ"],  1,    @players["#RVJ08JR2"],    2,    47,   33,   0, 0],
            [war, @players["#PV0LJJU0"],  5,    @players["#JL0L08VY"],    2,    35,   31,   0, 0],
            [war, @players["#989Q0GP"],   6,    @players["#RCQ0J0JR"],    4,    52,   23,   2, 0],
            [war, @players["#VY2CQJ02"],  8,    @players["#RVJ08JR2"],    2,    33,   3,    0, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_GOLD_n_SHOWERS
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          gold_n_showers = Clan.find_by_coc_id("#8U28UGQV")
          if new_world_9.nil? || gold_n_showers.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and gold_n_showers ('#8U28UGQV')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("24/10/2015".to_date, 10, new_world_9, gold_n_showers, gold_n_showers)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs gold_n_showers"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(gold_n_showers)
          # the battles, ordered by time, first to last.
          [ [war, @players["#P2809GVJ"],  6,    @players["#9PQ2LV8L"],    7,    78,   1429, 2, 2],
            [war, @players["#2YUYU2GJG"], 8,    @players["#JPG9YRV"],     8,    64,   1392, 2, 2],
            [war, @players["#JCL20Y8Y"],  7,    @players["#9GRJQV82"],    9,    96,   1378, 2, 2],
            [war, @players["#JPG9YRV"],   8,    @players["#PV0LJJU0"],    6,    40,   1332, 0, 0],
            [war, @players["#2YCPPUL8"],  3,    @players["#PQVUJ2PR"],    3,    41,   1324, 0, 0],
            [war, @players["#CPG2L0YV"],  10,   @players["#LVR8RQ8V"],    10,   100,  1268, 3, 3],
            [war, @players["#LVR8RQ8V"],  10,   @players["#CPG2L0YV"],    10,   35,   1242, 0, 0],
            [war, @players["#9CGCVCYQ"],  2,    @players["#PQVUJ2PR"],    3,    42,   1234, 0, 0],
            [war, @players["#P2809GVJ"],  6,    @players["#2YUYU2GJG"],   8,    0,    1232, 0, 0],
            [war, @players["#8UQ9Y02V"],  9,    @players["#CPG2L0YV"],    10,   100,  1225, 3, 3],
            [war, @players["#RCQ0J0JR"],  4,    @players["#RV28RPVP"],    4,    68,   1217, 2, 2],
            [war, @players["#8UQ9Y02V"],  9,    @players["#2YUYU2GJG"],   8,    51,   1199, 1, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#U2PJ8LJV"],    5,    42,   1117, 0, 0],
            [war, @players["#U2PJ8LJV"],  5,    @players["#2YUYU2GJG"],   8,    47,   1107, 0, 0],
            [war, @players["#9PQ2LV8L"],  7,    @players["#JCL20Y8Y"],    7,    64,   1096, 2, 2],
            [war, @players["#2YCPPUL8"],  3,    @players["#LLVCLU2G"],    5,    86,   1008, 2, 2],
            [war, @players["#RV28RPVP"],  4,    @players["#RCQ0J0JR"],    4,    68,   977,  2, 2],
            [war, @players["#LLVCLU2G"],  5,    @players["#U2PJ8LJV"],    5,    75,   951,  2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#9CGCVCYQ"],    2,    49,   887,  1, 1],
            [war, @players["#9PQ2LV8L"],  7,    @players["#8UQ9Y02V"],    9,    69,   805,  2, 2],
            [war, @players["#YG0L22CJ"],  1,    @players["#PQVUJ2PR"],    3,    94,   804,  2, 2],
            [war, @players["#JCL20Y8Y"],  7,    @players["#2YUYU2GJG"],   8,    66,   701,  1, 0],
            [war, @players["#RCQ0J0JR"],  4,    @players["#P2809GVJ"],    6,    68,   678,  2, 2],
            [war, @players["#U2PJ8LJV"],  5,    @players["#9GRJQV82"],    9,    93,   329,  2, 0],
            [war, @players["#9GRJQV82"],  9,    @players["#8UQ9Y02V"],    9,    34,   306,  0, 0],
            [war, @players["#LVR8RQ8V"],  10,   @players["#9GRJQV82"],    9,    47,   253,  0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#YG0L22CJ"],    1,    47,   246,  1, 1],
            [war, @players["#RVJ08JR2"],  2,    @players["#2YCPPUL8"],    3,    47,   232,  1, 1],
            [war, @players["#PV0LJJU0"],  6,    @players["#2YCPPUL8"],    3,    43,   186,  0, 0],
            [war, @players["#RVJ08JR2"],  2,    @players["#9CGCVCYQ"],    2,    55,   150,  2, 1],
            [war, @players["#9CGCVCYQ"],  2,    @players["#PV0LJJU0"],    6,    72,   34,   2, 2],
            [war, @players["#CPG2L0YV"],  10,   @players["#8UQ9Y02V"],    9,    41,   25,   0, 0],
            [war, @players["#YG0L22CJ"],  1,    @players["#RVJ08JR2"],    2,    45,   17,   1, 1],
            [war, @players["#RV28RPVP"],  4,    @players["#2YUYU2GJG"],   8,    79,   16,   2, 1],
            [war, @players["#JPG9YRV"],   8,    @players["#9GRJQV82"],    9,    100,  9,    3, 1],
            [war, @players["#LLVCLU2G"],  5,    @players["#JCL20Y8Y"],    7,    65,   5,    2, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#8UQ9Y02V"],    9,    69,   0,    2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_cep_2
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          cep_2 = Clan.find_by_coc_id("#28VL98JV")
          if new_world_9.nil? || cep_2.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and cep_2 ('#28VL98JV')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("31/10/2015".to_date, 10, new_world_9, cep_2, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs cep_2"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(cep_2)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  10,   @players["#2LY2GJVL8"],   10,   100,  1436, 3, 3],
            [war, @players["#PGYPLU0U"],  5,    @players["#9PQ2LV8L"],    8,    78,   1434, 2, 2],
            [war, @players["#9PQ2LV8L"],  8,    @players["#828P2G08"],    8,    60,   1292, 2, 2],
            [war, @players["#LLVCLU2G"],  6,    @players["#PP0Y0CGC"],    6,    75,   1283, 2, 2],
            [war, @players["#220QV0VUY"], 4,    @players["#PV0LJJU0"],    7,    53,   1245, 2, 2],
            [war, @players["#PQVUJ2PR"],  3,    @players["#220QV0VUY"],   4,    32,   1147, 0, 0],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#PGYPLU0U"],    5,    52,   1068, 1, 1],
            [war, @players["#828P2G08"],  8,    @players["#9GRJQV82"],    9,    100,  1045, 3, 3],
            [war, @players["#PQVUJ2PR"],  3,    @players["#82RGUJ8Y"],    3,    67,   883,  2, 2],
            [war, @players["#82RGUJ8Y"],  3,    @players["#L9QJ2JYQ"],    4,    48,   792,  1, 1],
            [war, @players["#2YPLL90VY"], 7,    @players["#LLVCLU2G"],    6,    59,   754,  1, 1],
            [war, @players["#J2V8YCPP"],  2,    @players["#PQVUJ2PR"],    3,    70,   540,  2, 1],
            [war, @players["#220QV0VUY"], 4,    @players["#RCQ0J0JR"],    5,    76,   534,  2, 2],
            [war, @players["#L80LRGCV"],  9,    @players["#9PQ2LV8L"],    8,    41,   488,  0, 0],
            [war, @players["#2LY2GJVL8"], 10,   @players["#CPG2L0YV"],    10,   68,   456,  2, 0],
            [war, @players["#82RGUJ8Y"],  3,    @players["#LLVCLU2G"],    6,    95,   431,  2, 1],
            [war, @players["#80JL8Q2J"],  1,    @players["#R20YLVUP"],    1,    32,   412,  1, 1],
            [war, @players["#PP0Y0CGC"],  6,    @players["#9PQ2LV8L"],    8,    45,   387,  0, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#2YPLL90VY"],   7,    79,   364,  2, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#220QV0VUY"],   4,    100,  243,  3, 3],
            [war, @players["#CPG2L0YV"],  10,   @players["#L80LRGCV"],    9,    64,   240,  1, 1],
            [war, @players["#PV0LJJU0"],  7,    @players["#PGYPLU0U"],    5,    58,   224,  2, 1],
            [war, @players["#9GRJQV82"],  9,    @players["#L80LRGCV"],    9,    31,   221,  0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#J2V8YCPP"],    2,    52,   209,  2, 2],
            [war, @players["#828P2G08"],  8,    @players["#9PQ2LV8L"],    8,    56,   146,  1, 0],
            [war, @players["#9PQ2LV8L"],  8,    @players["#L80LRGCV"],    9,    100,  134,  3, 2],
            [war, @players["#RVJ08JR2"],  2,    @players["#82RGUJ8Y"],    3,    100,  122,  3, 1],
            [war, @players["#80JL8Q2J"],  1,    @players["#PQVUJ2PR"],    3,    78,   95,   1, 0],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#828P2G08"],    8,    50,   93,   1, 0],
            [war, @players["#RCQ0J0JR"],  5,    @players["#828P2G08"],    8,    45,   74,   0, 0],
            [war, @players["#R20YLVUP"],  1,    @players["#80JL8Q2J"],    1,    35,   68,   1, 1],
            [war, @players["#RCQ0J0JR"],  5,    @players["#PP0Y0CGC"],    6,    75,   32,   2, 0],
            [war, @players["#PGYPLU0U"],  5,    @players["#L9QJ2JYQ"],    4,    82,   7,    1, 0],
            [war, @players["#LLVCLU2G"],  6,    @players["#828P2G08"],    8,    100,  4,    3, 1]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_les_chouquettes
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          les_chouquettes = Clan.find_by_coc_id("#2QV8LYP2")
          if new_world_9.nil? || les_chouquettes.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and les_chouquettes ('#2QV8LYP2')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("7/11/2015".to_date, 10, new_world_9, les_chouquettes, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs les_chouquettes"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(les_chouquettes)
          # the battles, ordered by time, first to last.
          [ [war, @players["#LJL99JYV"],  4,    @players["#LLVCLU2G"],    6,    47,   1435, 0, 0],
            [war, @players["#28JY9UUL"],  1,    @players["#RVJ08JR2"],    1,    67,   1435, 2, 2],
            [war, @players["#UL089Q0Q"],  10,   @players["#CPG2L0YV"],    10,   100,  1427, 3, 3],
            [war, @players["#CPG2L0YV"],  10,   @players["#UL089Q0Q"],    10,   100,  1413, 3, 3],
            [war, @players["#28CYGQ20"],  6,    @players["#9PQ2LV8L"],    8,    78,   1411, 2, 2],
            [war, @players["#QQGV09CJ"],  2,    @players["#R20YLVUP"],    2,    58,   1407, 1, 1],
            [war, @players["#P0YLCC2J"],  5,    @players["#PV0LJJU0"],    7,    37,   1400, 0, 0],
            [war, @players["#222UVGU0P"], 7,    @players["#9GRJQV82"],    9,    100,  1227, 3, 3],
            [war, @players["#R20YLVUP"],  2,    @players["#QQGV09CJ"],    2,    41,   1101, 1, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#2PYRYG0P"],    3,    50,   1070, 1, 1],
            [war, @players["#CPG2L0YV"],  10,   @players["#298RGCGU2"],   9,    79,   1031, 2, 2],
            [war, @players["#9PQ2LV8L"],  8,    @players["#U8YPR0R9"],    8,    39,   1003, 0, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#P0YLCC2J"],    5,    70,   1002, 2, 2],
            [war, @players["#RCQ0J0JR"],  5,    @players["#28CYGQ20"],    6,    100,  950,  3, 3],
            [war, @players["#2PYRYG0P"],  3,    @players["#RCQ0J0JR"],    5,    52,   824,  1, 1],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#222UVGU0P"],   7,    60,   817,  1, 1],
            [war, @players["#298RGCGU2"], 9,    @players["#9PQ2LV8L"],    8,    42,   814,  0, 0],
            [war, @players["#28CYGQ20"],  6,    @players["#PV0LJJU0"],    7,    77,   758,  2, 2],
            [war, @players["#LJL99JYV"],  4,    @players["#RCQ0J0JR"],    5,    63,   751,  2, 1],
            [war, @players["#QQGV09CJ"],  2,    @players["#L9QJ2JYQ"],    4,    78,   749,  2, 2],
            [war, @players["#222UVGU0P"], 7,    @players["#9PQ2LV8L"],    8,    69,   744,  1, 0],
            [war, @players["#298RGCGU2"], 9,    @players["#9GRJQV82"],    9,    85,   734,  1, 0],
            [war, @players["#2PYRYG0P"],  3,    @players["#LLVCLU2G"],    6,    80,   718,  2, 2],
            [war, @players["#RCQ0J0JR"],  5,    @players["#LJL99JYV"],    4,    84,   682,  2, 2],
            [war, @players["#28JY9UUL"],  1,    @players["#PQVUJ2PR"],    3,    88,   633,  2, 2],
            [war, @players["#UL089Q0Q"],  10,   @players["#9PQ2LV8L"],    8,    42,   486,  0, 0],
            [war, @players["#U8YPR0R9"],  8,    @players["#9PQ2LV8L"],    8,    73,   385,  2, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#U8YPR0R9"],    8,    100,  332,  3, 3],
            [war, @players["#LLVCLU2G"],  6,    @players["#222UVGU0P"],   7,    83,   328,  2, 1],
            [war, @players["#R20YLVUP"],  2,    @players["#28JY9UUL"],    1,    40,   295,  1, 1],
            [war, @players["#9PQ2LV8L"],  8,    @players["#298RGCGU2"],   9,    100,  239,  3, 1],
            [war, @players["#RVJ08JR2"],  1,    @players["#2PYRYG0P"],    3,    100,  175,  3, 2],
            [war, @players["#L9QJ2JYQ"],  4,    @players["#P0YLCC2J"],    5,    42,   112,  0, 0],
            [war, @players["#9GRJQV82"],  9,    @players["#298RGCGU2"],   9,    88,   105,  2, 0],
            [war, @players["#9GRJQV82"],  9,    @players["#U8YPR0R9"],    8,    55,   99,   2, 0],
            [war, @players["#RVJ08JR2"],  1,    @players["#LJL99JYV"],    4,    100,  87,   3, 1],
            [war, @players["#U8YPR0R9"],  8,    @players["#PV0LJJU0"],    7,    66,   83,   2, 0],
            [war, @players["#P0YLCC2J"],  5,    @players["#9PQ2LV8L"],    8,    100,  75,   3, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#P0YLCC2J"],    5,    76,   62,   2, 0],
            [war, @players["#LLVCLU2G"],  6,    @players["#P0YLCC2J"],    5,    79,   11,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Sons_of_hanover
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          sons_of_hanover = Clan.find_by_coc_id("#2QY8GQQ0")
          if new_world_9.nil? || sons_of_hanover.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and sons_of_hanover ('#2QY8GQQ0')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("14/11/2015".to_date, 10, new_world_9, sons_of_hanover, sons_of_hanover)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs sons_of_hanover"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(sons_of_hanover)
          # the battles, ordered by time, first to last.
          [ [war, @players["#PJ92Q9JV"],  4,    @players["#RCQ0J0JR"],    5,    64,   1335, 2, 2],
            [war, @players["#LYY0GCGC"],  6,    @players["#PV0LJJU0"],    7,    77,   1189, 2, 2],
            [war, @players["#CPG2L0YV"],  10,   @players["#V8LL0C9V"],    10,   63,   1147, 1, 1],
            [war, @players["#9PQ2LV8L"],  9,    @players["#LPJRV2UL"],    9,    69,   951,  2, 2],
            [war, @players["#QJPCV9PU"],  8,    @players["#9PQ2LV8L"],    9,    48,   756,  1, 1],
            [war, @players["#LPJRV2UL"],  9,    @players["#CPG2L0YV"],    10,   100,  736,  3, 3],
            [war, @players["#QP9G0YJC"],  2,    @players["#PQVUJ2PR"],    3,    71,   703,  2, 2],
            [war, @players["#RCQ0J0JR"],  5,    @players["#JQUJ2Q2L"],    5,    86,   659,  2, 2],
            [war, @players["#RCQ0J0JR"],  5,    @players["#LYY0GCGC"],    6,    94,   476,  2, 2],
            [war, @players["#9PQ2LV8L"],  9,    @players["#V8LL0C9V"],    10,   100,  428,  3, 2],
            [war, @players["#8RC802PJ"],  3,    @players["#L9QJ2JYQ"],    4,    58,   377,  2, 2],
            [war, @players["#LVCCCGR8"],  7,    @players["#G28VPUR"],     8,    58,   362,  2, 2],
            [war, @players["#LLVCLU2G"],  6,    @players["#PJ92Q9JV"],    4,    53,   316,  2, 2],
            [war, @players["#LPJRV2UL"],  9,    @players["#9PQ2LV8L"],    9,    56,   309,  2, 1],
            [war, @players["#PV0LJJU0"],  7,    @players["#LVCCCGR8"],    7,    92,   300,  2, 2],
            [war, @players["#PQ82LP28"],  1,    @players["#R20YLVUP"],    2,    58,   282,  1, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#8RC802PJ"],    3,    27,   270,  0, 0],
            [war, @players["#LVCCCGR8"],  7,    @players["#LLVCLU2G"],    6,    55,   246,  2, 2],
            [war, @players["#R20YLVUP"],  2,    @players["#PQ82LP28"],    1,    47,   244,  0, 0],
            [war, @players["#RVJ08JR2"],  1,    @players["#PJ92Q9JV"],    4,    33,   236,  0, 0],
            [war, @players["#QJPCV9PU"],  8,    @players["#G28VPUR"],     8,    66,   201,  2, 0],
            [war, @players["#LYY0GCGC"],  6,    @players["#9PQ2LV8L"],    9,    68,   194,  2, 0],
            [war, @players["#RVJ08JR2"],  1,    @players["#8RC802PJ"],    3,    100,  183,  3, 3],
            [war, @players["#CPG2L0YV"],  10,   @players["#LPJRV2UL"],    9,    54,   168,  1, 0],
            [war, @players["#8RC802PJ"],  3,    @players["#9PQ2LV8L"],    9,    100,  161,  3, 1],
            [war, @players["#G28VPUR"],   8,    @players["#QJPCV9PU"],    8,    52,   145,  1, 1],
            [war, @players["#V8LL0C9V"],  10,   @players["#CPG2L0YV"],    10,   100,  127,  3, 0],
            [war, @players["#PV0LJJU0"],  7,    @players["#QJPCV9PU"],    8,    62,   127,  2, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#LPJRV2UL"],    9,    100,  116,  3, 1],
            [war, @players["#RVJ08JR2"],  1,    @players["#PQ82LP28"],    1,    41,   82,   1, 1],
            [war, @players["#LLVCLU2G"],  6,    @players["#QJPCV9PU"],    8,    79,   72,   2, 0],
            [war, @players["#JQUJ2Q2L"],  5,    @players["#G28VPUR"],     8,    44,   71,   0, 0],
            [war, @players["#R20YLVUP"],  2,    @players["#QP9G0YJC"],    2,    31,   67,   1, 1],
            [war, @players["#QP9G0YJC"],  2,    @players["#RVJ08JR2"],    1,    67,   25,   2, 2],
            [war, @players["#PQ82LP28"],  1,    @players["#LLVCLU2G"],    6,    100,  20,   3, 1],
            [war, @players["#G28VPUR"],   8,    @players["#JQUJ2Q2L"],    8,    56,   12,   1, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_les_subprimes
          # # the clans
          # new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          # les_subprimes = Clan.find_by_coc_id("#80R0RUUL")
          # if new_world_9.nil? || les_subprimes.nil?
          #   puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and les_subprimes ('#80R0RUUL')"
          #   return
          # end
          # # the war, date: d/m/yyyy
          # war = create_war("7/11/2015".to_date, 10, new_world_9, les_subprimes, les_subprimes)
          # if war.nil?
          #   puts "WARNING:  not creating new world 9 vs les_subprimes"
          #   return
          # end
          # # the players
          # add_players_for_clan(new_world_9)
          # add_players_for_clan(les_subprimes)
          # # the battles, ordered by time, first to last.
          # [ [war, @players["#9P2CRRVY"],  4,    @players["#RCQ0J0JR"],    4,    67,   1355, 2, 2],
          #   [war, @players["#R20YLVUP"],  2,    @players["#20VJYCR2"],    2,    49,   1290, 0, 0],
          #   [war, @players["#CPG2L0YV"],  10,   @players["#GYVQVGCP"],    10,   100,  1253, 3, 3],
          #   [war, @players["#9GRJQV82"],  9,    @players["#9UGGR0CQ"],    9,    82,   1228, 2, 2],
          #   [war, @players["#RCQ0J0JR"],  4,    @players["#PPLR9R9R"],    6,    100,  1176, 3, 3]
          #   # that's me vs vaako at 19h 36m left
          # ].each do |data|
          #   create_battle(data)
          # end
        end


        def create_new_world_9_vs_Meute_Des_Loups
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          meute_des_loups = Clan.find_by_coc_id("#PRPYPQR")
          if new_world_9.nil? || meute_des_loups.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and meute_des_loups ('#PRPYPQR')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("9/1/2016".to_date, 10, new_world_9, meute_des_loups, meute_des_loups)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs meute_des_loups"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(meute_des_loups)
          # the battles, ordered by time, first to last.
          [ [war, @players["#CPG2L0YV"],  9,    @players["#RJ9VQC8Q"],    9,    85,   1412, 1, 1],
            [war, @players["#R20YLVUP"],  1,    @players["#9QJY9GQJ"],    1,    50,   1384, 1, 1],
            [war, @players["#8QJ2JVRL"],  6,    @players["#CPG2L0YV"],    9,    91,   1300, 1, 1],
            [war, @players["#RJ9VQC8Q"],  9,    @players["#CPG2L0YV"],    9,    100,  1222, 3, 2],
            [war, @players["#RVJJJ8PC"],  4,    @players["#RCQ0J0JR"],    3,    50,   1167, 1, 1],
            [war, @players["#RJ9VQC8Q"],  9,    @players["#LP2YRGG0"],    10,   97,   1122, 1, 1],
            [war, @players["#PQVUJ2PR"],  2,    @players["#2GL8P0QL"],    3,    55,   1112, 2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#G8GJJUJG"],    2,    85,   1058, 2, 2],
            [war, @players["#R0U289PJ"],  7,    @players["#LRL02J"],      7,    44,   995,  1, 1],
            [war, @players["#CRCY2QY0"],  8,    @players["#JV09PPV0"],    8,    60,   983,  1, 1],
            [war, @players["#9PQ2LV8L"],  6,    @players["#8QJ2JVRL"],    6,    66,   980,  1, 1],
            [war, @players["#9QJY9GQJ"],  1,    @players["#PQVUJ2PR"],    2,    68,   909,  2, 2],
            [war, @players["#RCQ0J0JR"],  3,    @players["#JYVP20RY"],    5,    70,   850,  2, 2],
            [war, @players["#CPG2L0YV"],  9,    @players["#892YG29CL"],   10,   100,  799,  3, 3],
            [war, @players["#PV0LJJU0"],  5,    @players["#RVJJJ8PC"],    4,    56,   695,  2, 2],
            [war, @players["#RCQ0J0JR"],  3,    @players["#8QJ2JVRL"],    6,    92,   681,  2, 1],
            [war, @players["#PV0LJJU0"],  5,    @players["#LRL02J"],      7,    100,  677,  3, 2],
            [war, @players["#2GL8P0QL"],  3,    @players["#L9QJ2JYQ"],    4,    91,   672,  2, 2],
            [war, @players["#LRL02J"],    7,    @players["#R0U289PJ"],    7,    87,   355,  2, 2],
            [war, @players["#G8GJJUJG"],  2,    @players["#RCQ0J0JR"],    3,    64,   269,  2, 1],
            [war, @players["#JYVP20RY"],  5,    @players["#9PQ2LV8L"],    6,    46,   263,  0, 0],
            [war, @players["#JV09PPV0"],  8,    @players["#CRCY2QY0"],    8,    84,   260,  2, 2],
            [war, @players["#LRL02J"],    7,    @players["#LP2YRGG0"],    10,   100,  254,  3, 2],
            [war, @players["#9QJY9GQJ"],  1,    @players["#R20YLVUP"],    1,    56,   225,  2, 2],
            [war, @players["#PQVUJ2PR"],  2,    @players["#JV09PPV0"],    8,    96,   202,  2, 1],
            [war, @players["#R0U289PJ"],  7,    @players["#RJ9VQC8Q"],    9,    100,  153,  3, 2],
            [war, @players["#LP2YRGG0"],  10,   @players["#JV09PPV0"],    8,    44,   138,  0, 0],
            [war, @players["#2GL8P0QL"],  3,    @players["#9PQ2LV8L"],    6,    100,  115,  3, 3],
            [war, @players["#CRCY2QY0"],  8,    @players["#8QJ2JVRL"],    6,    38,   107,  1, 0],
            [war, @players["#9PQ2LV8L"],  6,    @players["#JV09PPV0"],    8,    100,  97,   3, 1],
            [war, @players["#JV09PPV0"],  8,    @players["#R0U289PJ"],    7,    100,  42,   3, 1],
            [war, @players["#JYVP20RY"],  5,    @players["#CRCY2QY0"],    8,    100,  11,   3, 1],
            [war, @players["#RVJJJ8PC"],  4,    @players["#PV0LJJU0"],    5,    56,   0,    2, 2],
            [war, @players["#G8GJJUJG"],  2,    @players["#L9QJ2JYQ"],    4,    57,   0,    1, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Devils_Rejects
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          devils_rejects = Clan.find_by_coc_id("#P9LQJQ9C")
          if new_world_9.nil? || devils_rejects.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and devils_rejects ('#P9LQJQ9C')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("16/1/2016".to_date, 10, new_world_9, devils_rejects, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs devils_rejects"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(devils_rejects)
          # the battles, ordered by time, first to last.
          [ [war, @players["#LJ88JJ22"],  8,    @players["#CRCY2QY0"],    8,    58,   1407, 1, 1],
            [war, @players["#208VRY09L"], 6,    @players["#9PQ2LV8L"],    6,    49,   1371, 1, 1],
            [war, @players["#200CPRQR9"], 7,    @players["#R0U289PJ"],    7,    52,   1320, 2, 2],
            [war, @players["#RVJ08JR2"],  1,    @players["#P8QV0GGC"],    1,    47,   1312, 1, 1],
            [war, @players["#Q0VYUPL9"],  3,    @players["#PQVUJ2PR"],    3,    33,   1254, 0, 0],
            [war, @players["#2QR2VP8Q2"], 9,    @players["#CPG2L0YV"],    9,    100,  1250, 3, 3],
            [war, @players["#J2LRYRCR"],  5,    @players["#PV0LJJU0"],    5,    45,   1244, 0, 0],
            [war, @players["#RCQ0J0JR"],  4,    @players["#J2LRYRCR"],    5,    100,  1235, 3, 3],
            [war, @players["#CPG2L0YV"],  9,    @players["#2QR2VP8Q2"],   9,    83,   1173, 1, 1],
            [war, @players["#PV0LJJU0"],  5,    @players["#2L0QL2JY9"],   4,    70,   1149, 2, 2],
            [war, @players["#PQVUJ2PR"],  3,    @players["#Q0VYUPL9"],    3,    40,   1141, 1, 1],
            [war, @players["#CRCY2QY0"],  8,    @players["#208VRY09L"],   6,    100,  1134, 3, 3],
            [war, @players["#R0U289PJ"],  7,    @players["#200CPRQR9"],   7,    100,  1114, 3, 3],
            [war, @players["#P8QV0GGC"],  1,    @players["#RVJ08JR2"],    1,    34,   1096, 0, 0],
            [war, @players["#R20YLVUP"],  2,    @players["#QPJL9PPQ"],    2,    63,   1082, 2, 2],
            [war, @players["#9PQ2LV8L"],  6,    @players["#LJ88JJ22"],    8,    100,  1047, 3, 3],
            [war, @players["#PV0LJJU0"],  5,    @players["#Q0VYUPL9"],    3,    63,   1045, 2, 1],
            [war, @players["#QPJL9PPQ"],  2,    @players["#PQVUJ2PR"],    3,    38,   1040, 0, 0],
            [war, @players["#RVJ08JR2"],  1,    @players["#2L0QL2JY9"],   4,    100,  1025, 3, 1],
            [war, @players["#P8QV0GGC"],  1,    @players["#PQVUJ2PR"],    3,    61,   1014, 2, 2],
            [war, @players["#2QR2VP8Q2"], 9,    @players["#LP2YRGG0"],    10,   100,  704,  3, 3],
            [war, @players["#2L0QL2JY9"], 4,    @players["#RCQ0J0JR"],    4,    51,   552,  2, 2],
            [war, @players["#LJ88JJ22"],  8,    @players["#R0U289PJ"],    7,    47,   550,  0, 0],
            [war, @players["#QPJL9PPQ"],  2,    @players["#R20YLVUP"],    2,    49,   470,  0, 0],
            [war, @players["#CPG2L0YV"],  9,    @players["#LJ88JJ22"],    8,    77,   354,  2, 0],
            [war, @players["#R20YLVUP"],  2,    @players["#P8QV0GGC"],    1,    36,   352,  1, 0],
            [war, @players["#200CPRQR9"], 7,    @players["#CRCY2QY0"],    8,    58,   344,  2, 1],
            [war, @players["#J2LRYRCR"],  5,    @players["#CRCY2QY0"],    8,    81,   301,  1, 0],
            [war, @players["#RCQ0J0JR"],  4,    @players["#Q0VYUPL9"],    3,    96,   161,  2, 0],
            [war, @players["#Q0VYUPL9"],  3,    @players["#9PQ2LV8L"],    6,    41,   127,  0, 0],
            [war, @players["#P8QV0GGC"],  1,    @players["#PQVUJ2PR"],    3,    21,   66,   0, 0],
            [war, @players["#9PQ2LV8L"],  6,    @players["#2QR2VP8Q2"],   9,    100,  51,   3, 2],
            [war, @players["#CRCY2QY0"],  8,    @players["#V2LC02VV"],    10,   100,  47,   3, 3],
            [war, @players["#R0U289PJ"],  7,    @players["#208VRY09L"],   6,    100,  4,    3, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_The_Roughnecks
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          the_roughnecks = Clan.find_by_coc_id("#8V9GGJPY")
          if new_world_9.nil? || the_roughnecks.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and the_roughnecks ('#8V9GGJPY')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("23/1/2016".to_date, 10, new_world_9, the_roughnecks, the_roughnecks)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs the_roughnecks"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(the_roughnecks)
          # the battles, ordered by time, first to last.
          [ [war, @players["#P8UPGLGC"],  9,    @players["#CPG2L0YV"],    9,    100,  1426, 3, 3],
            [war, @players["#R20YLVUP"],  1,    @players["#2YYUUC9R"],    1,    62,   1404, 1, 1],
            [war, @players["#CPG2L0YV"],  9,    @players["#P8UPGLGC"],    9,    68,   1309, 1, 1],
            [war, @players["#9U0YRPU"],   2,    @players["#PV0LJJU0"],    4,    60,   1266, 2, 2],
            [war, @players["#R20YLVUP"],  1,    @players["#9U0YRPU"],     2,    70,   1182, 2, 2],
            [war, @players["#9CCR29J8"],  6,    @players["#9PQ2LV8L"],    6,    51,   1164, 1, 1],
            [war, @players["#G28VPUR"],   5,    @players["#90UQPJ2L"],    5,    48,   1142, 0, 0],
            [war, @players["#PV0LJJU0"],  4,    @players["#PY0Q2QLQ"],    4,    50,   1094, 2, 2],
            [war, @players["#8R99LQL8"],  7,    @players["#CRCY2QY0"],    8,    100,  1093, 3, 3],
            [war, @players["#VPPLYG9C"],  10,   @players["#LP2YRGG0"],    10,   60,   1066, 1, 1],
            [war, @players["#R0U289PJ"],  7,    @players["#8R99LQL8"],    7,    79,   1040, 2, 2],
            [war, @players["#9CCR29J8"],  6,    @players["#G28VPUR"],     5,    42,   1020, 1, 1],
            [war, @players["#CPG2L0YV"],  9,    @players["#VPPLYG9C"],    10,   100,  998,  3, 3],
            [war, @players["#CRCY2QY0"],  8,    @players["#20LP98PLU"],   8,    91,   995,  2, 2],
            [war, @players["#20LP98PLU"], 8,    @players["#LP2YRGG0"],    10,   100,  878,  3, 2],
            [war, @players["#8R99LQL8"],  7,    @players["#R0U289PJ"],    7,    90,   835,  2, 2],
            [war, @players["#RCQ0J0JR"],  3,    @players["#90UQPJ2L"],    5,    68,   749,  1, 1],
            [war, @players["#RCQ0J0JR"],  3,    @players["#QR2R8RRU"],    3,    62,   723,  2, 2],
            [war, @players["#PV0LJJU0"],  4,    @players["#9CCR29J8"],    6,    73,   529,  2, 2],
            [war, @players["#VPPLYG9C"],  10,   @players["#R0U289PJ"],    7,    55,   422,  1, 0],
            [war, @players["#90UQPJ2L"],  5,    @players["#R0U289PJ"],    7,    54,   404,  1, 0],
            [war, @players["#PQVUJ2PR"],  2,    @players["#90UQPJ2L"],    5,    33,   234,  0, 0],
            [war, @players["#2YYUUC9R"],  1,    @players["#G28VPUR"],     5,    100,  182,  3, 2],
            [war, @players["#9PQ2LV8L"],  6,    @players["#P8UPGLGC"],    9,    74,   160,  2, 1],
            [war, @players["#PY0Q2QLQ"],  4,    @players["#9PQ2LV8L"],    6,    94,   121,  2, 1],
            [war, @players["#90UQPJ2L"],  5,    @players["#RCQ0J0JR"],    3,    55,   119,  2, 2],
            [war, @players["#9U0YRPU"],   2,    @players["#PQVUJ2PR"],    2,    39,   73,   0, 0],
            [war, @players["#9PQ2LV8L"],  6,    @players["#20LP98PLU"],   8,    97,   55,   2, 0],
            [war, @players["#QR2R8RRU"],  3,    @players["#9PQ2LV8L"],    6,    100,  55,   3, 1],
            [war, @players["#R0U289PJ"],  7,    @players["#20LP98PLU"],   8,    68,   51,   1, 0],
            [war, @players["#G28VPUR"],   5,    @players["#P8UPGLGC"],    9,    100,  32,   3, 1],
            [war, @players["#20LP98PLU"], 8,    @players["#R0U289PJ"],    7,    81,   23,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_The_Mustards
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          the_mustards = Clan.find_by_coc_id("#2LQCLR8V")
          if new_world_9.nil? || the_mustards.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and the_mustards ('#2LQCLR8V')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("30/1/2016".to_date, 10, new_world_9, the_mustards, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs the_mustards"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(the_mustards)
          # the battles, ordered by time, first to last.
          [ [war, @players["#RVJ08JR2"],  1,    @players["#9PVQVC28"],    1,    55,   1426, 2, 2],
            [war, @players["#RVJ08JR2"],  1,    @players["#Y9R28C2C"],    2,    58,   1324, 2, 2],
            [war, @players["#CPG2L0YV"],  10,   @players["#8QV9UG99"],    10,   100,  1309, 3, 3],
            [war, @players["#U9J9G9YR"],  7,    @players["#9GRJQV82"],    9,    100,  1195, 3, 3],
            [war, @players["#9GRJQV82"],  9,    @players["#28R00LC8Q"],   9,    100,  1182, 3, 3],
            [war, @players["#G9JJVQY2"],  8,    @players["#R0U289PJ"],    8,    60,   1138, 2, 2],
            [war, @players["#PQVUJ2PR"],  3,    @players["#2RQY9V9"],     4,    43,   1043, 1, 1],
            [war, @players["#R20YLVUP"],  2,    @players["#2898LVQJQ"],   3,    75,   1033, 2, 2],
            [war, @players["#PV0LJJU0"],  5,    @players["#CJJ2YQU"],     5,    81,   1004, 2, 2],
            [war, @players["#Y9R28C2C"],  2,    @players["#RCQ0J0JR"],    4,    100,  1003, 3, 3],
            [war, @players["#28R00LC8Q"], 9,    @players["#CPG2L0YV"],    10,   53,   963,  2, 2],
            [war, @players["#CJJ2YQU"],   5,    @players["#PV0LJJU0"],    5,    62,   959,  2, 2],
            [war, @players["#R0U289PJ"],  8,    @players["#G9JJVQY2"],    8,    48,   953,  1, 1],
            [war, @players["#RCQ0J0JR"],  4,    @players["#YU0J0QU9"],    6,    100,  724,  3, 3],
            [war, @players["#RCQ0J0JR"],  4,    @players["#2RQY9V9"],     4,    73,   591,  2, 1],
            [war, @players["#2898LVQJQ"], 3,    @players["#PQVUJ2PR"],    3,    52,   423,  1, 1],
            [war, @players["#PV0LJJU0"],  5,    @players["#U9J9G9YR"],    7,    80,   350,  2, 2],
            [war, @players["#28R00LC8Q"], 9,    @players["#9PQ2LV8L"],    7,    34,   309,  0, 0],
            [war, @players["#CPG2L0YV"],  10,   @players["#G9JJVQY2"],    8,    76,   287,  2, 1],
            [war, @players["#R20YLVUP"],  2,    @players["#U9J9G9YR"],    7,    100,  283,  3, 1],
            [war, @players["#8QV9UG99"],  10,   @players["#CPG2L0YV"],    10,   20,   239,  0, 0],
            [war, @players["#8QV9UG99"],  10,   @players["#9PQ2LV8L"],    7,    0,    236,  0, 0],
            [war, @players["#9PQ2LV8L"],  7,    @players["#G9JJVQY2"],    8,    51,   173,  1, 0],
            [war, @players["#9PVQVC28"],  1,    @players["#9PQ2LV8L"],    7,    100,  153,  3, 3],
            [war, @players["#R0U289PJ"],  8,    @players["#CJJ2YQU"],     5,    52,   104,  1, 0],
            [war, @players["#YU0J0QU9"],  6,    @players["#CPG2L0YV"],    10,   100,  53,   3, 1],
            [war, @players["#Y9R28C2C"],  2,    @players["#G28VPUR"],     6,    100,  46,   3, 3],
            [war, @players["#9PQ2LV8L"],  7,    @players["#2RQY9V9"],     4,    60,   26,   2, 0],
            [war, @players["#YU0J0QU9"],  6,    @players["#R0U289PJ"],    8,    84,   15,   2, 0],
            [war, @players["#PQVUJ2PR"],  3,    @players["#G9JJVQY2"],    8,    51,   10,   2, 0],
            [war, @players["#2898LVQJQ"], 3,    @players["#PV0LJJU0"],    5,    68,   0,    2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_werld_9_vs_game_of_rhones
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          game_of_rhones = Clan.find_by_coc_id("#U0U0YCP")
          if new_world_9.nil? || game_of_rhones.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and game_of_rhones ('#U0U0YCP')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("6/2/2016".to_date, 10, new_world_9, game_of_rhones, game_of_rhones)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs game_of_rhones"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(game_of_rhones)
          # the battles, ordered by time, first to last.
          [ [war, @players["#VLU92QR0"],  10,   @players["#CPG2L0YV"],    10,   100,  1351, 3, 3],
            [war, @players["#RVJ08JR2"],  1,    @players["#2QLQYYU0"],    1,    39,   1003, 0, 0],
            [war, @players["#R0U289PJ"],  8,    @players["#LRYPLGUG"],    8,    51,   872,  2, 2],
            [war, @players["#RVJ08JR2"],  1,    @players["#98YQP98G"],    2,    83,   833,  2, 2],
            [war, @players["#RCQ0J0JR"],  4,    @players["#C8CQ8GJP"],    5,    78,   671,  2, 2],
            [war, @players["#2GP9Y9LJ0"], 9,    @players["#9GRJQV82"],    9,    100,  665,  3, 3],
            [war, @players["#22QCUJVYV"], 4,    @players["#L9QJ2JYQ"],    5,    94,   663,  2, 2],
            [war, @players["#2QLQYYU0"],  1,    @players["#R20YLVUP"],    2,    87,   553,  2, 2],
            [war, @players["#98YQP98G"],  2,    @players["#PQVUJ2PR"],    3,    89,   546,  2, 2],
            [war, @players["#GL2CJV09"],  6,    @players["#9PQ2LV8L"],    7,    100,  541,  3, 3],
            [war, @players["#PV0LJJU0"],  6,    @players["#GL2CJV09"],    6,    57,   440,  1, 1],
            [war, @players["#VLU92QR0"],  10,   @players["#R0U289PJ"],    8,    100,  387,  3, 3],
            [war, @players["#2QLQYYU0"],  1,    @players["#RVJ08JR2"],    1,    58,   379,  2, 2],
            [war, @players["#C8CQ8GJP"],  5,    @players["#PV0LJJU0"],    6,    73,   356,  2, 2],
            [war, @players["#98YQP98G"],  2,    @players["#RVJ08JR2"],    1,    80,   346,  2, 0],
            [war, @players["#289RGGJGU"], 7,    @players["#PV0LJJU0"],    6,    66,   344,  2, 0],
            [war, @players["#R20YLVUP"],  2,    @players["#20UPPCPL9"],   3,    68,   321,  2, 2],
            [war, @players["#CPG2L0YV"],  10,   @players["#VLU92QR0"],    10,   100,  308,  3, 3],
            [war, @players["#20UPPCPL9"], 3,    @players["#RCQ0J0JR"],    4,    100,  303,  3, 3],
            [war, @players["#9PQ2LV8L"],  7,    @players["#2GP9Y9LJ0"],   9,    100,  216,  3, 3],
            [war, @players["#GL2CJV09"],  6,    @players["#PV0LJJU0"],    6,    66,   176,  1, 0],
            [war, @players["#PV0LJJU0"],  6,    @players["#289RGGJGU"],   7,    100,  169,  3, 3],
            [war, @players["#PQVUJ2PR"],  3,    @players["#22QCUJVYV"],   4,    47,   167,  1, 1],
            [war, @players["#C8CQ8GJP"],  5,    @players["#L9QJ2JYQ"],    5,    64,   165,  2, 0],
            [war, @players["#L9QJ2JYQ"],  5,    @players["#GL2CJV09"],    6,    33,   105,  0, 0],
            [war, @players["#R20YLVUP"],  2,    @players["#2QLQYYU0"],    1,    47,   96,   0, 0],
            [war, @players["#LRYPLGUG"],  8,    @players["#9GRJQV82"],    9,    53,   95,   1, 0],
            [war, @players["#RCQ0J0JR"],  4,    @players["#GL2CJV09"],    6,    79,   88,   2, 1],
            [war, @players["#PQVUJ2PR"],  3,    @players["#GL2CJV09"],    6,    77,   75,   2, 0],
            [war, @players["#9PQ2LV8L"],  7,    @players["#LRYPLGUG"],    8,    100,  58,   3, 1],
            [war, @players["#22QCUJVYV"], 4,    @players["#PV0LJJU0"],    6,    60,   44,   1, 0],
            [war, @players["#20UPPCPL9"], 3,    @players["#R20YLVUP"],    2,    60,   35,   2, 0],
            [war, @players["#R0U289PJ"],  8,    @players["#GL2CJV09"],    6,    53,   23,   1, 0],
            [war, @players["#LRYPLGUG"],  8,    @players["#R0U289PJ"],    8,    52,   19,   1, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_werld_9_vs_Elite_Hamburg
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          elite_hamburg = Clan.find_by_coc_id("#JPYUJRC")
          if new_world_9.nil? || elite_hamburg.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and elite_hamburg ('#JPYUJRC')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("13/2/2016".to_date, 10, new_world_9, elite_hamburg, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs elite_hamburg"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(elite_hamburg)
          # the battles, ordered by time, first to last.
          [ [war, @players["#22VLVCC2L"], 8,  @players["#CRCY2QY0"],  8,  90,   1415, 2, 2],
            [war, @players["#9PQ2LV8L"],  6,  @players["#YJ9RLURU"],  7,  100,  1401, 3, 3],
            [war, @players["#JJY8P8U8"],  2,  @players["#RCQ0J0JR"],  3,  62,   1392, 2, 2],
            [war, @players["#8L89R8C0"],  1,  @players["#PQVUJ2PR"],  2,  47,   1376, 1, 1],
            [war, @players["#9PQ2LV8L"],  6,  @players["#22VLVCC2L"], 8,  100,  1334, 3, 3],
            [war, @players["#CPG2L0YV"],  10, @players["#2V2Q2Q09V"], 10, 100,  1236, 3, 3],
            [war, @players["#PV0LJJU0"],  5,  @players["#8GJ9QVPG"],  5,  100,  1232, 3, 3],
            [war, @players["#PQVUJ2PR"],  2,  @players["#28VY9G80Q"], 4,  100,  1154, 3, 3],
            [war, @players["#PV0LJJU0"],  5,  @players["#CGGULVQ"],   3,  100,  1122, 3, 3],
            [war, @players["#RVJ08JR2"],  1,  @players["#JJY8P8U8"],  2,  100,  910,  3, 3],
            [war, @players["#CRCY2QY0"],  8,  @players["#820QVVRC2"], 6,  64,   876,  1, 1],
            [war, @players["#R0U289PJ"],  7,  @players["#820QVVRC2"], 6,  44,   838,  0, 0],
            [war, @players["#RCQ0J0JR"],  3,  @players["#820QVVRC2"], 6,  100,  690,  3, 2],
            [war, @players["#22VLVCC2L"], 8,  @players["#9GRJQV82"],  9,  82,   655,  2, 2],
            [war, @players["#28VY9G80Q"], 4,  @players["#CPG2L0YV"],  10, 100,  551,  3, 3],
            [war, @players["#JJY8P8U8"],  2,  @players["#9PQ2LV8L"],  6,  50,   538,  2, 2],
            [war, @players["#28VY9G80Q"], 4,  @players["#R0U289PJ"],  7,  100,  507,  3, 3],
            [war, @players["#820QVVRC2"], 6,  @players["#PV0LJJU0"],  5,  48,   377,  0, 0],
            [war, @players["#CPG2L0YV"],  10, @players["#82RVY0QLV"], 9,  76,   295,  2, 2],
            [war, @players["#8L89R8C0"],  1,  @players["#PV0LJJU0"],  5,  54,   207,  1, 1],
            [war, @players["#CGGULVQ"],   3,  @players["#L9QJ2JYQ"],  4,  72,   205,  1, 1],
            [war, @players["#PQVUJ2PR"],  2,  @players["#8L89R8C0"],  1,  43,   194,  0, 0],
            [war, @players["#RVJ08JR2"],  1,  @players["#8L89R8C0"],  1,  53,   168,  2, 2],
            [war, @players["#CRCY2QY0"],  8,  @players["#82RVY0QLV"], 9,  82,   128,  2, 0],
            [war, @players["#R0U289PJ"],  7,  @players["#82RVY0QLV"], 9,  100,  124,  3, 1],
            [war, @players["#RCQ0J0JR"],  3,  @players["#CGGULVQ"],   3,  72,   50,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Rasht_Tick
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          rasht_tick = Clan.find_by_coc_id("#L8RRJPQ")
          if new_world_9.nil? || rasht_tick.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and rasht_tick ('#L8RRJPQ')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("20/2/2016".to_date, 10, new_world_9, rasht_tick, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs rasht_tick"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(rasht_tick)
          # the battles, ordered by time, first to last.
          [ [war, @players["#9PQ2LV8L"],  6,  @players["#YYPC0P8Y"],  8,  65,   1349, 1, 1],
            [war, @players["#CPG2L0YV"],  10, @players["#V9Q2V2J2"],  10, 100,  1281, 3, 3],
            [war, @players["#R20YLVUP"],  2,  @players["#G8UCCC88"],  4,  100,  1233, 3, 3],
            [war, @players["#YYPC0P8Y"],  8,  @players["#9GRJQV82"],  9,  100,  1132, 3, 3],
            [war, @players["#PV0LJJU0"],  5,  @players["#202VGUP9L"], 5,  75,   979,  2, 2],
            [war, @players["#PV0LJJU0"],  5,  @players["#UUUVYJGG"],  6,  100,  937,  3, 3],
            [war, @players["#G8UCCC88"],  4,  @players["#9PQ2LV8L"],  6,  68,   832,  2, 2],
            [war, @players["#L9QJ2JYQ"],  4,  @players["#LV8QYQVP"],  7,  76,   717,  2, 2],
            [war, @players["#CLQGQVG2"],  2,  @players["#PQVUJ2PR"],  3,  70,   643,  1, 1],
            [war, @players["#YYPC0P8Y"],  8,  @players["#CPG2L0YV"],  10, 100,  636,  3, 3],
            [war, @players["#202VGUP9L"], 5,  @players["#R0U289PJ"],  8,  71,   626,  2, 2],
            [war, @players["#GY9YL809"],  7,  @players["#92G8QG8Y"],  9,  100,  621,  3, 3],
            [war, @players["#GJ9LUQC8"],  1,  @players["#RVJ08JR2"],  1,  39,   569,  0, 0],
            [war, @players["#G8UCCC88"],  4,  @players["#GY9YL809"],  7,  51,   421,  1, 1],
            [war, @players["#CLQGQVG2"],  2,  @players["#PV0LJJU0"],  5,  83,   408,  1, 1],
            [war, @players["#R20YLVUP"],  2,  @players["#CLQGQVG2"],  2,  63,   353,  2, 2],
            [war, @players["#RVJ08JR2"],  1,  @players["#GJ9LUQC8"],  1,  54,   244,  1, 1],
            [war, @players["#PQVUJ2PR"],  3,  @players["#8Q8JYQ8"],   3,  35,   205,  1, 1],
            [war, @players["#R0U289PJ"],  8,  @players["#YYPC0P8Y"],  8,  48,   173,  1, 0],
            [war, @players["#PQVUJ2PR"],  3,  @players["#YYPC0P8Y"],  8,  49,   94,   1, 0],
            [war, @players["#R0U289PJ"],  8,  @players["#LV8QYQVP"],  7,  56,   66,   2, 0],
            [war, @players["#RVJ08JR2"],  1,  @players["#8Q8JYQ8"],   3,  99,   49,   2, 1],
            [war, @players["#GY9YL809"],  7,  @players["#YYPC0P8Y"],  8,  19,   44,   0, 0],
            [war, @players["#L9QJ2JYQ"],  4,  @players["#YYPC0P8Y"],  8,  48,   18,   0, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Purple_Savages
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          purple_savages = Clan.find_by_coc_id("#9UJ8Q82P")
          if new_world_9.nil? || purple_savages.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and purple_savages ('#9UJ8Q82P')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("5/3/2016".to_date, 10, new_world_9, purple_savages, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs purple_savages"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(purple_savages)
          # the battles, ordered by time, first to last.
          [ [war, @players["#22VGGUCG"],  3,  @players["#RCQ0J0JR"],  3,  80,   1429, 2, 2],
            [war, @players["#28CL8V9R2"], 9,  @players["#R0U289PJ"],  9,  42,   1419, 0, 0],
            [war, @players["#99CLQ8YC"],  1,  @players["#R20YLVUP"],  1,  51,   1407, 1, 1],
            [war, @players["#R20YLVUP"],  1,  @players["#RLUCLUGP"],  2,  67,   1395, 2, 2],
            [war, @players["#228Q28RUG"], 8,  @players["#202LR8G2"],  8,  77,   1385, 2, 2],
            [war, @players["#22VGGUCG"],  3,  @players["#Y2U2Q20G"],  2,  36,   1344, 0, 0],
            [war, @players["#CPG2L0YV"],  10, @players["#2PPCLV28J"], 10, 100,  1341, 3, 3],
            [war, @players["#9PQ2LV8L"],  6,  @players["#PQ8GJ9CG"],  7,  54,   1330, 1, 1],
            [war, @players["#2PPCLV28J"], 10, @players["#CPG2L0YV"],  10, 59,   1330, 1, 1],
            [war, @players["#RCQ0J0JR"],  3,  @players["#QGYQJRUV"],  4,  83,   1317, 2, 2],
            [war, @players["#PQ8GJ9CG"],  7,  @players["#GY9YL809"],  7,  59,   1183, 1, 1],
            [war, @players["#PUUJU92G"],  6,  @players["#9PQ2LV8L"],  6,  100,  1162, 3, 3],
            [war, @players["#Y2U2Q20G"],  2,  @players["#22VGGUCG"],  3,  100,  1161, 3, 3],
            [war, @players["#228Q28RUG"], 8,  @players["#28CL8V9R2"], 9,  88,   1133, 2, 2],
            [war, @players["#9PQ2LV8L"],  6,  @players["#PUUJU92G"],  6,  52,   1097, 1, 1],
            [war, @players["#R20YLVUP"],  1,  @players["#99CLQ8YC"],  1,  72,   1068, 2, 2],
            [war, @players["#99CLQ8YC"],  1,  @players["#Y2U2Q20G"],  2,  46,   1033, 0, 0],
            [war, @players["#RLUCLUGP"],  2,  @players["#Y2U2Q20G"],  2,  61,   893,  2, 2],
            [war, @players["#28CL8V9R2"], 9,  @players["#CPG2L0YV"],  10, 75,   798,  2, 1],
            [war, @players["#RCQ0J0JR"],  3,  @players["#LU8RP8Q2"],  5,  100,  703,  3, 3],
            [war, @players["#QGYQJRUV"],  4,  @players["#L9QJ2JYQ"],  4,  58,   649,  2, 2],
            [war, @players["#CPG2L0YV"],  10, @players["#202LR8G2"],  8,  58,   385,  2, 0],
            [war, @players["#PV0LJJU0"],  5,  @players["#PUUJU92G"],  6,  66,   276,  1, 0],
            [war, @players["#R0U289PJ"],  9,  @players["#28CL8V9R2"], 9,  100,  219,  3, 1],
            [war, @players["#QGYQJRUV"],  4,  @players["#PV0LJJU0"],  5,  66,   208,  2, 2],
            [war, @players["#PUUJU92G"],  6,  @players["#228Q28RUG"], 8,  100,  185,  3, 3],
            [war, @players["#PQ8GJ9CG"],  7,  @players["#R0U289PJ"],  9,  100,  129,  3, 3],
            [war, @players["#PV0LJJU0"],  5,  @players["#PQ8GJ9CG"],  7,  54,   123,  1, 0],
            [war, @players["#Y2U2Q20G"],  2,  @players["#PUUJU92G"],  6,  74,   121,  2, 1],
            [war, @players["#GY9YL809"],  7,  @players["#PQ8GJ9CG"],  7,  60,   84,   2, 1],
            [war, @players["#GY9YL809"],  7,  @players["#202LR8G2"],  8,  100,  68,   3, 1],
            [war, @players["#LU8RP8Q2"],  5,  @players["#GY9YL809"],  7,  66,   50,   2, 1],
            [war, @players["#R0U289PJ"],  9,  @players["#202LR8G2"],  8,  54,   26,   2, 0]
          ].each do |data|
            create_battle(data)
          end
        end


        def create_new_world_9_vs_Belgium_at_war
          # the clans
          new_world_9 = Clan.find_by_coc_id("#8JR8G8L9")
          belgium_at_war = Clan.find_by_coc_id("#2CQ900RU")
          if new_world_9.nil? || belgium_at_war.nil?
            puts "WARNING:  unable to create the war/battles for new world 9 ('#8JR8G8L9') and belgium_at_war ('#2CQ900RU')"
            return
          end
          # the war, date: d/m/yyyy
          war = create_war("12/3/2016".to_date, 15, new_world_9, belgium_at_war, new_world_9)
          if war.nil?
            puts "WARNING:  not creating new world 9 vs belgium_at_war"
            return
          end
          # the players
          add_players_for_clan(new_world_9)
          add_players_for_clan(belgium_at_war)
          # the battles, ordered by time, first to last.
          [ [war, @players["#Y8VLPQ0J"],  5,  @players["#PV0LJJU0"],  5,  43,   1427, 0, 0],
            [war, @players["#8CLR8V2G"],  15, @players["#828JPJ9Y"],  15, 70,   1426, 2, 2],
            [war, @players["#YG88R2JY"],  7,  @players["#GY9YL809"],  7,  70,   1415, 2, 2],
            [war, @players["#LLQ9QVYV"],  8,  @players["#R0U289PJ"],  8,  64,   1408, 2, 2],
            [war, @players["#2228PY9QC"], 9,  @players["#VQ9QVGC"],   9,  60,   1403, 1, 1],
            [war, @players["#RCQ0J0JR"],  4,  @players["#Y8VLPQ0J"],  5,  100,  1373, 3, 3],
            [war, @players["#22YCPRQJU"], 13, @players["#9GRJQV82"],  13, 76,   1351, 2, 2],
            [war, @players["#228Q28RUG"], 10, @players["#R22YV9QU"],  11, 81,   1338, 2, 2],
            [war, @players["#9PQ2LV8L"],  6,  @players["#PCPQQLVJ"],  6,  68,   1335, 1, 1],
            [war, @players["#8CLR8V2G"],  15, @players["#2QRYUG2L"],  14, 49,   1307, 0, 0],
            [war, @players["#GY9YL809"],  7,  @players["#LLQ9QVYV"],  8,  82,   1219, 2, 2],
            [war, @players["#CPG2L0YV"],  14, @players["#2QRYUG2L"],  14, 100,  1212, 3, 3],
            [war, @players["#228Q28RUG"], 10, @players["#8CQJR0YL"],  12, 100,  1175, 3, 3],
            [war, @players["#R20YLVUP"],  2,  @players["#YUY0PLVY"],  3,  80,   1147, 2, 2],
            [war, @players["#2228PY9QC"], 9,  @players["#22YCPRQJU"], 13, 100,  1137, 3, 3],
            [war, @players["#RVJ08JR2"],  1,  @players["#LJQQ8VC"],   1,  30,   1129, 0, 0],
            [war, @players["#GY9YL809"],  7,  @players["#299QU0UUC"], 10, 100,  1026, 3, 3],
            [war, @players["#RCQ0J0JR"],  4,  @players["#YG88R2JY"],  7,  100,  884,  3, 3],
            [war, @players["#R0U289PJ"],  8,  @players["#PCPQQLVJ"],  6,  100,  840,  1, 0],
            [war, @players["#CRCY2QY0"],  12, @players["#VQ9QVGC"],   9,  61,   824,  2, 1],
            [war, @players["#828JPJ9Y"],  15, @players["#8CLR8V2G"],  15, 52,   779,  2, 2],
            [war, @players["#YUY0PLVY"],  3,  @players["#Y2U2Q20G"],  3,  48,   762,  0, 0],
            [war, @players["#80L9G28Y"],  2,  @players["#R20YLVUP"],  2,  56,   619,  2, 2],
            [war, @players["#299QU0UUC"], 10, @players["#228Q28RUG"], 10, 86,   592,  1, 1],
            [war, @players["#R22YV9QU"],  11, @players["#RY9LYY0P"],  11, 100,  544,  3, 3],
            [war, @players["#YG88R2JY"],  7,  @players["#2228PY9QC"], 9,  68,   533,  2, 2],
            [war, @players["#PCPQQLVJ"],  6,  @players["#9PQ2LV8L"],  6,  100,  528,  3, 3],
            [war, @players["#8CQJR0YL"],  12, @players["#CRCY2QY0"],  12, 60,   522,  2, 2],
            [war, @players["#Y8VLPQ0J"],  5,  @players["#228Q28RUG"], 10, 92,   516,  2, 1],
            [war, @players["#YUY0PLVY"],  3,  @players["#PV0LJJU0"],  5,  100,  513,  3, 3],
            [war, @players["#828JPJ9Y"],  15, @players["#CPG2L0YV"],  14, 62,   507,  1, 1],
            [war, @players["#RY9LYY0P"],  11, @players["#828JPJ9Y"],  15, 100,  495,  3, 1],
            [war, @players["#LJQQ8VC"],   1,  @players["#RVJ08JR2"],  1,  40,   460,  0, 0],
            [war, @players["#LLQ9QVYV"],  8,  @players["#CRCY2QY0"],  12, 100,  435,  3, 1],
            [war, @players["#Y2U2Q20G"],  3,  @players["#PCPQQLVJ"],  6,  82,   430,  1, 0],
            [war, @players["#R22YV9QU"],  11, @players["#2228PY9QC"], 9,  100,  376,  3, 1],
            [war, @players["#299QU0UUC"], 10, @players["#9GRJQV82"],  13, 100,  371,  3, 1],
            [war, @players["#PV0LJJU0"],  5,  @players["#PCPQQLVJ"],  6,  79,   358,  2, 1],
            [war, @players["#22YCPRQJU"], 13, @players["#CPG2L0YV"],  14, 64,   349,  2, 1],
            [war, @players["#CPG2L0YV"],  14, @players["#8CQJR0YL"],  12, 50,   310,  1, 0],
            [war, @players["#PJYQYP0R"],  4,  @players["#RCQ0J0JR"],  4,  34,   303,  0, 0],
            [war, @players["#2QRYUG2L"],  14, @players["#8CLR8V2G"],  15, 78,   272,  2, 0],
            [war, @players["#80L9G28Y"],  2,  @players["#RCQ0J0JR"],  4,  100,  191,  3, 3],
            [war, @players["#PCPQQLVJ"],  6,  @players["#R0U289PJ"],  8,  53,   183,  2, 0],
            [war, @players["#R20YLVUP"],  2,  @players["#80L9G28Y"],  2,  100,  166,  3, 3],
            [war, @players["#8CQJR0YL"],  12, @players["#8CLR8V2G"],  15, 100,  135,  3, 1],
            [war, @players["#RVJ08JR2"],  1,  @players["#PJYQYP0R"],  4,  100,  112,  3, 3],
            [war, @players["#LJQQ8VC"],   1,  @players["#Y2U2Q20G"],  3,  61,   102,  2, 2],
            [war, @players["#PJYQYP0R"],  4,  @players["#CPG2L0YV"],  14, 62,   73,   2, 0],
            [war, @players["#Y2U2Q20G"],  3,  @players["#LLQ9QVYV"],  8,  100,  53,   3, 1],
            [war, @players["#9PQ2LV8L"],  6,  @players["#R22YV9QU"],  11, 100,  41,   3, 1],
            [war, @players["#CRCY2QY0"],  12, @players["#PCPQQLVJ"],  6,  44,   25,   0, 0],
            [war, @players["#R0U289PJ"],  8,  @players["#VQ9QVGC"],   9,  70,   20,   2, 0],
            [war, @players["#PV0LJJU0"],  5,  @players["#VQ9QVGC"],   9,  68,   0,    2, 0]
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
        # [ War, Attacker, "attacker_rank", Defender, "defender_rank", "destruction_percent", "minutes_left_in_war", "stars_awarded", "war_stars_awarded" ]
        # [  0 ,    1     ,       2       ,     3   ,        4       ,           5          ,           6          ,        7       ,           8         ]
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
              war_stars_awarded: data[8]
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


        def create_war(date, team_size, clan1, clan2, winning_clan=nil)
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
          clan_war_1 = ClanWar.create(
            war: war, 
            clan: clan1, 
            player_count: team_size, 
            winner: clan1 == winning_clan
          )
          war.clan_wars << clan_war_1
          clan_war_2 = ClanWar.create(
            war: war, 
            clan: clan2, 
            player_count: team_size, 
            winner: clan2 == winning_clan
          )
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

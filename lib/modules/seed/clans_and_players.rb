# You're looking at the Clan and Players seed file.
module Seed
  class ClansAndPlayers

    class << self

      def add_clans_and_their_players
        @clans = {}
        create_clans
        create_players
      end

      
      private

        def create_clans
          current_clan_count = Clan.all.count
          puts "____________________"
          puts "adding clans to the existing #{current_clan_count} clan(s)..."
          # This list is arranged alphabetically by the "name" column (data[3])
          [ ['#28VL98JV', Clan::CLAN_TYPE_INVITE, 5,  'cep 2',            1400, Clan::WAR_FREQUENCY_ALWAYS,       48],
            ['#PYCCJJUC', Clan::CLAN_TYPE_INVITE, 5,  'CLANprive',        1400, Clan::WAR_FREQUENCY_ALWAYS,       92],
            ['#8YGC2RRV', Clan::CLAN_TYPE_INVITE, 5,  'Doguimie',         1800, Clan::WAR_FREQUENCY_ALWAYS,       87],
            ['#Y0QVU2YC', Clan::CLAN_TYPE_INVITE, 2,  'Galaxyguardians',  800,  Clan::WAR_FREQUENCY_ALWAYS,       10],
            ['#8U28UGQV', Clan::CLAN_TYPE_INVITE, 3,  'GOLD n SHOWERS',   1000, Clan::WAR_FREQUENCY_WEEKLY,       9],
            ['#2QV8LYP2', Clan::CLAN_TYPE_INVITE, 5,  'les chouquettes',  1600, Clan::WAR_FREQUENCY_ALWAYS,       82],
            ['#2VCLRR2U', Clan::CLAN_TYPE_INVITE, 6,  'Lien Minh COC',    2100, Clan::WAR_FREQUENCY_ALWAYS,       84],
            ['#CYQ0C8G',  Clan::CLAN_TYPE_INVITE, 3,  'LOS PAY@S XXL',    1800, Clan::WAR_FREQUENCY_WEEKLY,       26],
            ['#P9UVQ0Y',  Clan::CLAN_TYPE_INVITE, 5,  'LosCareCompleto',  1800, Clan::WAR_FREQUENCY_TWICE_WEEKLY, 26],
            ['#8JR8G8L9', Clan::CLAN_TYPE_INVITE, 4,  'New World 9',      1000, Clan::WAR_FREQUENCY_WEEKLY,       55],
            ['#QLVJ092',  Clan::CLAN_TYPE_INVITE, 5,  'pinklove',         1600, Clan::WAR_FREQUENCY_ALWAYS,       99],
            ['#PRP2LJP',  Clan::CLAN_TYPE_INVITE, 3,  'Powers That Be',   1500, Clan::WAR_FREQUENCY_NOT_SET,      13],
            ['#2VRU2V0L', Clan::CLAN_TYPE_INVITE, 5,  'Swiss Keks',       0,    Clan::WAR_FREQUENCY_ALWAYS,       51],
            ['#2QY8GQQ0', Clan::CLAN_TYPE_INVITE, 5,  'Sons of hanover',  800,  Clan::WAR_FREQUENCY_TWICE_WEEKLY, 35],
            ['#PGG2R0JY', Clan::CLAN_TYPE_CLOSED, 4,  'The trooper',      800,  Clan::WAR_FREQUENCY_TWICE_WEEKLY, 42],
            ['#8QG0G9P0', Clan::CLAN_TYPE_INVITE, 3,  '**HEIST**',        2100, Clan::WAR_FREQUENCY_TWICE_WEEKLY, 19]
          ].each do |data|
            create_clan(data)
          end
          puts "completed clans seed, there are now #{Clan.all.count} clan(s)."
          puts "--------------------"
        end
 

        # data is assumed to be in the following format:
        # [ "coc_id", "clan_type", "level", "name", "required_trophies", "war_frequency", "wars_won" ]
        # [     0   ,      1     ,    2   ,    3  ,          4         ,          5     ,      6     ]
        def create_clan(data)
          puts "---------------------"
          puts "attempting clan creation for coc_id '#{data[0]}' and name '#{data[3]}'"
          clan = Clan.find_by_coc_id(data[0])
          if clan.nil?
            clan = Clan.new(
              coc_id: data[0], 
              clan_type: data[1],
              level: data[2],
              name: data[3],
              required_trophies: data[4],
              war_frequency: data[5],
              wars_won: data[6]
            )
            if clan.save
              puts "SUCCESS:  created clan of id '#{clan.id}' with coc_id '#{clan.coc_id}'."
            else
              puts "FAILED:   did NOT CREATE clan of coc_id #{data[0]}."
              puts "Errors:   #{clan.errors.full_messages}."
            end
          else
            puts "IGNORING: clan of coc_id '#{data[0]}' already exists."
          end
          @clans[clan.coc_id] = clan
          puts "---------------------"
        end


        def create_players
          current_player_count = Player.all.count
          puts "____________________"
          puts "adding players to the existing #{current_player_count} player(s)..."
          # This list is arranged alphabetically by the clan name (in comment), then 
          # by "name" column (data[2])
          #
          [ # cep 2
            ['#2LY2GJVL8',  61,   'bellevue',       @clans['#28VL98JV']],
            ['#220QV0VUY',  108,  'Blaininos',      @clans['#28VL98JV']],
            ['#2YPLL90VY',  92,   'cleyman',        @clans['#28VL98JV']],
            ['#828P2G08',   97,   'lap1',           @clans['#28VL98JV']],
            ['#80JL8Q2J',   132,  'Nux29',          @clans['#28VL98JV']],
            ['#J2V8YCPP',   111,  'P.casabianca',   @clans['#28VL98JV']],
            ['#L80LRGCV',   82,   'pepito',         @clans['#28VL98JV']],
            ['#PP0Y0CGC',   96,   'Rec Tom',        @clans['#28VL98JV']],
            ['#PGYPLU0U',   100,  'vic780',         @clans['#28VL98JV']],
            ['#82RGUJ8Y',   106,  'Wlad5683',       @clans['#28VL98JV']],

            # CLANprive
            ['#P9CCCRLY',   83,   'bok',            @clans['#PYCCJJUC']],
            ['#22CUJCQ8',   100,  'FERRIS',         @clans['#PYCCJJUC']],
            ['#J8Q9QU8P',   102,  'frank',          @clans['#PYCCJJUC']],
            ['#U8JVLRVC',   97,   'Helios',         @clans['#PYCCJJUC']],
            ['#LPCRCR0L',   115,  'lucacioffi1997', @clans['#PYCCJJUC']],
            ['#JJ8YCGQC',   104,  'Marcoangela',    @clans['#PYCCJJUC']],
            ['#QLCY2GL9',   117,  'place',          @clans['#PYCCJJUC']],
            ['#G8J0JGRR',   110,  'pzz',            @clans['#PYCCJJUC']],
            ['#80JJY2Q0',   102,  'Raiva',          @clans['#PYCCJJUC']],
            ['#Y0VYVYCV',   100,  'wei',            @clans['#PYCCJJUC']],

            # Doguimie<heart>
            ['#C0JJ2RJP',   103,  '57heaven',         @clans['#8YGC2RRV']],
            ['#9LG8YYCQ',   103,  '62-mefi-te',       @clans['#8YGC2RRV']],
            ['#PYCPC2LL',   88,   'Abd\'l',           @clans['#8YGC2RRV']],
            ['#LQ8RGUPU',   47,   'ancarla',          @clans['#8YGC2RRV']],
            ['#220QYUYCY',  94,   'BOUBAKAN',         @clans['#8YGC2RRV']],
            ['#29898Q2V',   100,  'dimofix',          @clans['#8YGC2RRV']],
            ['#2GCJJRYC',   100,  'Emilie',           @clans['#8YGC2RRV']],
            ['#Q80YJRU0',   102,  'guillaume',        @clans['#8YGC2RRV']],
            ['#G2QCY90U',   93,   'Jibbs66',          @clans['#8YGC2RRV']],
            ['#RGUJVYYC',   110,  'judas',            @clans['#8YGC2RRV']],
            ['#R9CVUCQY',   111,  'KozeN',            @clans['#8YGC2RRV']],
            ['#CULQULUU',   90,   'The AnCarLo',      @clans['#8YGC2RRV']],
            ['#GUR2PPYG',   96,   'Titom',            @clans['#8YGC2RRV']],
            ['#VRPJPRJU',   52,   'TonJeJe',          @clans['#8YGC2RRV']],
            ['#Y080JGCG',   84,   'wiskard legrand',  @clans['#8YGC2RRV']],

            # Galaxyguardians
            ['#R2GL8VCQ',   92,   'Ello<3',           @clans['#Y0QVU2YC']],
            ['#L80J8UPG',   104,  'Energizer#',       @clans['#Y0QVU2YC']],
            ['#YGL0G2VQ',   108,  'felixcristiano7',  @clans['#Y0QVU2YC']],
            ['#J80R8GGU',   97,   'INVICTUS',         @clans['#Y0QVU2YC']],
            ['#PPVJ008Y',   80,   'Rafa',             @clans['#Y0QVU2YC']],
            ['#LYPQPLR8',   90,   'RagnarViking',     @clans['#Y0QVU2YC']],
            ['#9VGLVGGY',   76,   'sandrino5',        @clans['#Y0QVU2YC']],
            ['#9QRVY2V8',   114,  'SkylineGP',        @clans['#Y0QVU2YC']],
            ['#YPPQCQYQ',   86,   'Vince IIIy',       @clans['#Y0QVU2YC']],
            ['#R2RL0LJ0',   77,   'woozzaa',          @clans['#Y0QVU2YC']],

            # GOLD n SHOWERS
            ['#YG0L22CJ',   125,  'adunny20',         @clans['#8U28UGQV']],
            ['#RV28RPVP',   111,  'bman83',           @clans['#8U28UGQV']],
            ['#LVR8RQ8V',   63,   'das Bush Wacka',   @clans['#8U28UGQV']],
            ['#8UQ9Y02V',   84,   'freShprince24',    @clans['#8U28UGQV']],
            ['#U2PJ8LJV',   87,   'jtree',            @clans['#8U28UGQV']],
            ['#P2809GVJ',   102,  'jvlinebager',      @clans['#8U28UGQV']],
            ['#JPG9YRV',    90,   'King Curtis',      @clans['#8U28UGQV']],
            ['#2YCPPUL8',   105,  'rudacris11',       @clans['#8U28UGQV']],
            ['#JCL20Y8Y',   88,   'solekal82',        @clans['#8U28UGQV']],
            ['#9CGCVCYQ',   114,  'Super Dave',       @clans['#8U28UGQV']],
            
            # les chouquettes
            ['#28CYGQ20',   96,   'aba',              @clans['#2QV8LYP2']],
            ['#LJL99JYV',   96,   'BEB-85',           @clans['#2QV8LYP2']],
            ['#2PYRYG0P',   112,  'Franzux',          @clans['#2QV8LYP2']],
            ['#222UVGU0P',  92,   'grrrrrr',          @clans['#2QV8LYP2']],
            ['#298RGCGU2',  73,   'Héloïse',          @clans['#2QV8LYP2']],
            ['#U8YPR0R9',   90,   'Jé',               @clans['#2QV8LYP2']],
            ['#UL089Q0Q',   64,   'Laurie56',         @clans['#2QV8LYP2']],
            ['#P0YLCC2J',   96,   'prince loic',      @clans['#2QV8LYP2']],
            ['#28JY9UUL',   124,  'Stephen56',        @clans['#2QV8LYP2']],
            ['#QQGV09CJ',   124,  'Vince',            @clans['#2QV8LYP2']],
            
            # Lien Minh COC
            ['#29GR0PLLJ',  84,   'games over',       @clans['#2VCLRR2U']],
            ['#8UJJ2P20',   92,   'Haivl',            @clans['#2VCLRR2U']],
            ['#2P9VQ9PYJ',  52,   'Hong Tien',        @clans['#2VCLRR2U']],
            ['#CYLRJJVC',   93,   'khicon',           @clans['#2VCLRR2U']],
            ['#JVPURRYC',   100,  'Luong',            @clans['#2VCLRR2U']],
            ['#UYY8GCQ2',   131,  'LUONG NGHE AN',    @clans['#2VCLRR2U']],
            ['#U2UR208L',   111,  'minh tuyet',       @clans['#2VCLRR2U']],
            ['#PJ8PGY0',    119,  'Sand',             @clans['#2VCLRR2U']],
            ['#JJ0UGLGQ',   100,  'Thanh Tung',       @clans['#2VCLRR2U']],
            ['#CP889L0R',   98,   'Thu Hien',         @clans['#2VCLRR2U']],
            

            # LOS PAY@S XXL
            ['#JG8RRP9Q',   87,   'A.J',            @clans['#CYQ0C8G']],
            ['#JUUYQJJ2',   88,   'alfoon !!!',     @clans['#CYQ0C8G']],
            ['#8CCUCP0',    64,   'Andrea_21',      @clans['#CYQ0C8G']],
            ['#8R2Y0C9G',   105,  'chavillazo',     @clans['#CYQ0C8G']],
            ['#2UQ2C2UQ',   105,  'chavillazo1385', @clans['#CYQ0C8G']],
            ['#2R8QQ8JG',   78,   'Gto el grande',  @clans['#CYQ0C8G']],
            ['#UJQRVYUV',   87,   'juanjo',         @clans['#CYQ0C8G']],
            ['#20P8QCQJY',  101,  'LOSPARRO561',    @clans['#CYQ0C8G']],
            ['#RV2YR0CC',   97,   'luis',           @clans['#CYQ0C8G']],
            ['#Q09PJPLU',   92,   'minitono',       @clans['#CYQ0C8G']],
            ['#PVPQPLLJ',   116,  'Psh',            @clans['#CYQ0C8G']],
            ['#20GUUQR02',  67,   'sole_junior',    @clans['#CYQ0C8G']],
            ['#8VGUCYQY',   82,   'sOle*90',        @clans['#CYQ0C8G']],
            ['#P02QQ89J',   103,  'toro',           @clans['#CYQ0C8G']],
            ['#JJGGJQRV',   88,   'Wasi2662',       @clans['#CYQ0C8G']],

            # LosCareCompleto
            ['#2PQCJVUL',   104,  'Actaral',    @clans['#P9UVQ0Y']],
            ['#LJRCPCVV',   87,   'chino',      @clans['#P9UVQ0Y']],
            ['#G2YCCJ9R',   102,  'choko',      @clans['#P9UVQ0Y']],
            ['#UUC9PC8U',   53,   'chokolate',  @clans['#P9UVQ0Y']],
            ['#LC2VJQ8U',   101,  'Don_Frio',   @clans['#P9UVQ0Y']],
            ['#L8V8PJG',    100,  'Istubar',    @clans['#P9UVQ0Y']],
            ['#8RY0YCRQ',   111,  'ivan',       @clans['#P9UVQ0Y']],
            ['#9U82R928',   97,   'pankhy',     @clans['#P9UVQ0Y']],
            ['#LQ990VRJ',   133,  'rey roma',   @clans['#P9UVQ0Y']],
            ['#2LRUUU9V0',  67,   'ROMADITRO',  @clans['#P9UVQ0Y']],

            # New World 9
            ['#RCQ0J0JR',   85,   'agent_chu',        @clans['#8JR8G8L9']],
            ['#8LYRQ8Y',    105,  'alexander',        @clans['#8JR8G8L9']],
            ['#YV2J2028',   89,   'andrew rampant',   @clans['#8JR8G8L9']],
            ['#9GRJQV82',   73,   'Bgeleyns',         @clans['#8JR8G8L9']],
            ['#LLVCLU2G',   91,   'charliedeuce',     @clans['#8JR8G8L9']],
            ['#L9QJ2JYQ',   86,   'Chromatomic',      @clans['#8JR8G8L9']],
            ['#PQVUJ2PR',   85,   'Count Dubula',     @clans['#8JR8G8L9']],
            ['#PV0LJJU0',   91,   'Dan',              @clans['#8JR8G8L9']],
            ['#QQ29RU8L',   86,   'HermanTheGerman',  @clans['#8JR8G8L9']],
            ['#22Q2L92V2',  63,   'hershbar',         @clans['#8JR8G8L9']],
            ['#R20YLVUP',   120,  'LeviUnderwood5',   @clans['#8JR8G8L9']],
            ['#RVJ08JR2',   103,  'Marian 2.0',       @clans['#8JR8G8L9']],
            ['#8Y2V2Q09',   112,  'munchbar',         @clans['#8JR8G8L9']],
            ['#CPG2L0YV',   47,   'Nunu',             @clans['#8JR8G8L9']],
            ['#GY9YL809',   85,   'ponikz',           @clans['#8JR8G8L9']],
            ['#2YUYU2GJG',  83,   'SAM',              @clans['#8JR8G8L9']],
            ['#9PQ2LV8L',   80,   'silence',          @clans['#8JR8G8L9']],
            ['#Y2U2Q20G',   99,   'staphnie',         @clans['#8JR8G8L9']],
            ['#QQUUCVVL',   67,   'TOOL55BOX',        @clans['#8JR8G8L9']],
            ['#G28VPUR',    91,   'wicked defense',   @clans['#8JR8G8L9']],
            ['#P9VVGU9J',   83,   '*a 83*',           @clans['#8JR8G8L9']],

            # pinklove
            ['#999Y2LU9',   92,   'boyboy',           @clans['#QLVJ092']],
            ['#28UJ9Q09P',  81,   'dangtruong',       @clans['#QLVJ092']],
            ['#J2UCCR0Y0',  76,   'Davit',            @clans['#QLVJ092']],
            ['#JP9G2YLL',   88,   'jake',             @clans['#QLVJ092']],
            ['#YCP2C90P',   84,   'jakego.',          @clans['#QLVJ092']],
            ['#CQ90P0J',    96,   'kaka',             @clans['#QLVJ092']],
            ['#2R8QPLVU',   106,  'linlin',           @clans['#QLVJ092']],
            ['#8LG98QC9',   100,  'Phavat*Daisa619',  @clans['#QLVJ092']],
            ['#Q2RJGCJR',   142,  'rains7ar',         @clans['#QLVJ092']],
            ['#2090VCURY',  86,   'Savut',            @clans['#QLVJ092']],
            ['#R9Y8PQ9L',   78,   'seth',             @clans['#QLVJ092']],
            ['#JJLY8RCJ',   78,   'Sheisuke',         @clans['#QLVJ092']],
            ['#YGPYQ209',   82,   'vichka',           @clans['#QLVJ092']],
            ['#2280C2UQV',  92,   'VitLoveLin',       @clans['#QLVJ092']],
            ['#2Y28LR9U',   88,   '_Daisa',           @clans['#QLVJ092']],

            # Powers That Be
            ['#CQUPV88Q',   91,   'BAY',              @clans['#PRP2LJP']],
            ['#JUQUJQJR',   106,  'Brent21',          @clans['#PRP2LJP']],
            ['#L8VVVCU',    124,  'bumblebeeeeeeee',  @clans['#PRP2LJP']],
            ['#28GYQYL2P',  58,   'God Of War!!!!!',  @clans['#PRP2LJP']],
            ['#9UQ8VUVY',   102,  'Jarrett',          @clans['#PRP2LJP']],
            ['#8LPLRJR9',   112,  'JAYCEE',           @clans['#PRP2LJP']],
            ['#PU0L8U09',   117,  'Super_Gamer 3',    @clans['#PRP2LJP']],
            ['#2RQ9P2YJ',   74,   'tee*la',           @clans['#PRP2LJP']],
            ['#L2JPV0GV',   94,   'TheRayC',          @clans['#PRP2LJP']],
            ['#2G0V0URG',   107,  '- hizzle17 -',     @clans['#PRP2LJP']],

            # Sons of hanover
            ['#PQ82LP28',   124,  'camelito!',        @clans['#2QY8GQQ0']],
            ['#QJPCV9PU',   90,   'FCB',              @clans['#2QY8GQQ0']],
            ['#LPJRV2UL',   91,   'Gutscchein',       @clans['#2QY8GQQ0']],
            ['#LVCCCGR8',   89,   'Jauels',           @clans['#2QY8GQQ0']],
            ['#8RC802PJ',   103,  'KingLolek',        @clans['#2QY8GQQ0']],
            ['#JQUJ2Q2L',   94,   'Krawallmeise',     @clans['#2QY8GQQ0']],
            ['#PJ92Q9JV',   98,   'marzipankrieger',  @clans['#2QY8GQQ0']],
            ['#QP9G0YJC',   123,  'mavericlZ',        @clans['#2QY8GQQ0']],
            ['#LYY0GCGC',   90,   'nashe',            @clans['#2QY8GQQ0']],
            ['#V8LL0C9V',   76,   'taugenichts',      @clans['#2QY8GQQ0']],
            

            # Swiss Keks
            ['#CCJY88VC',   96,   'c-man1',           @clans['#2VRU2V0L']],
            ['#JL0L08VY',   124,  'figo(Dübendorf)',  @clans['#2VRU2V0L']],
            ['#VY2CQJ02',   86,   'JAMS',             @clans['#2VRU2V0L']],
            ['#2U20Q9YQ',   114,  'Luckynellen',      @clans['#2VRU2V0L']],
            ['#QQCGR2QY',   89,   'Mazul94',          @clans['#2VRU2V0L']],
            ['#989Q0GP',    94,   'shaji',            @clans['#2VRU2V0L']],
            ['#209PYJJCP',  62,   'STEZDERKING',      @clans['#2VRU2V0L']],
            ['#2CJC29YQ',   140,  'Stez07',           @clans['#2VRU2V0L']],
            ['#UCR89YQ8',   95,   's/i/m/o/n/0011',   @clans['#2VRU2V0L']],
            ['#UP8P2LVY',   67,   'x13lack',          @clans['#2VRU2V0L']],
            
            # The trooper
            ['#PVCP0JYC',   108,  'Christophe',       @clans['#PGG2R0JY']],
            ['#V0ULJ80',    109,  'Fleoz',            @clans['#PGG2R0JY']],
            ['#LJ8899Y0',   89,   'mjiallau',         @clans['#PGG2R0JY']],
            ['#LCCG9CJV',   106,  'poupy lol',        @clans['#PGG2R0JY']],
            ['#2PVJJYRC',   91,   'Quentin 2014',     @clans['#PGG2R0JY']],
            ['#8U2QVUPP',   89,   'Ragnor',           @clans['#PGG2R0JY']],
            ['#28RGGYGJ8',  90,   'Roma71.',          @clans['#PGG2R0JY']],
            ['#G0U20U2',    95,   'TrolleurGeek',     @clans['#PGG2R0JY']],
            ['#92P0JQY2',   105,  'XxleoXx',          @clans['#PGG2R0JY']],
            ['#9GGLJJ',     119,  'xXMoMo71Xx',       @clans['#PGG2R0JY']],

            # **HEIST**
            ['#8PV2J92G', 98,   'bigbadjon10',      @clans['#8QG0G9P0']],
            ['#YC0JRGJU', 95,   'CmundaPhukinWizz', @clans['#8QG0G9P0']],
            ['#2GR800RV', 99,   'dinggong',         @clans['#8QG0G9P0']],
            ['#RUPY9RCU', 104,  'hero',             @clans['#8QG0G9P0']],
            ['#JR8298PJ', 115,  'jimmyzanter',      @clans['#8QG0G9P0']],
            ['#2899UVCJ', 117,  'Juzz',             @clans['#8QG0G9P0']],
            ['#GCLQGQGC', 128,  'me',               @clans['#8QG0G9P0']],
            ['#2CQPJG2C', 91,   'Michael',          @clans['#8QG0G9P0']],
            ['#GQQ8VVVU', 83,   'rickybobby',       @clans['#8QG0G9P0']],
            ['#C22C8LVL', 98,   'sakarami',         @clans['#8QG0G9P0']],
            ['#CPY2P0Y2', 106,  'Studmuffin',       @clans['#8QG0G9P0']],
            ['#98PU82UP', 75,   'Taydoo',           @clans['#8QG0G9P0']],
            ['#2L82U9YQ', 134,  'The Brave',        @clans['#8QG0G9P0']],
            ['#YL0R29G9', 114,  'workthecycle',     @clans['#8QG0G9P0']],
            ['#PP0JQUYR', 57,   '_Alex43_',         @clans['#8QG0G9P0']]
            
          ].each do |data|
            create_player(data)
          end
          puts "completed clans seed, there are now #{Clan.all.count} clan(s)."
          puts "--------------------"
        end
 

        # data is assumed to be in the following format:
        # [ "coc_id", "level", "name", Clan instance ]
        # [     0   ,    1   ,    2   ,      3       ]
        def create_player(data)
          puts "---------------------"
          puts "attempting player creation for coc_id '#{data[0]}', level '#{data[1]}', and name '#{data[2]}'"
          player = Player.find_by_coc_id(data[0])
          if player.nil?
            player = Player.new(
              coc_id: data[0], 
              level: data[1],
              name: data[2]
            )
            if player.save
              puts "SUCCESS:  created player of id '#{player.id}' with coc_id '#{player.coc_id}'."
              puts "          associating clan of coc_id '#{data[3].coc_id}..."
              ClanPlayer.create(clan: data[3], player: player, active: true)
              puts "          done."
            else
              puts "FAILED:   did NOT CREATE player of coc_id #{data[0]}."
              puts "Errors:   #{player.errors.full_messages}."
            end
          else
            puts "IGNORING: player of coc_id '#{data[0]}' already exists."
          end
          puts "---------------------"
        end

    end

  end
end

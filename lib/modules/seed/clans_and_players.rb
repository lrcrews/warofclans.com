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
          [ ['#2CQ900RU', Clan::CLAN_TYPE_INVITE, 7,  'Belgium at war',   1200, Clan::WAR_FREQUENCY_ALWAYS,       105],
            ['#28VL98JV', Clan::CLAN_TYPE_INVITE, 5,  'cep 2',            1400, Clan::WAR_FREQUENCY_ALWAYS,       48],
            ['#PYCCJJUC', Clan::CLAN_TYPE_INVITE, 5,  'CLANprive',        1400, Clan::WAR_FREQUENCY_ALWAYS,       92],
            ['#P9LQJQ9C', Clan::CLAN_TYPE_INVITE, 6,  'Devils Rejects',   0,    Clan::WAR_FREQUENCY_TWICE_WEEKLY, 57],
            ['#8YGC2RRV', Clan::CLAN_TYPE_INVITE, 5,  'Doguimie',         1800, Clan::WAR_FREQUENCY_ALWAYS,       87],
            ['#JPYUJRC',  Clan::CLAN_TYPE_ANYONE, 5,  'Elite Hamburg',    1600, Clan::WAR_FREQUENCY_ALWAYS,       72],
            ['#Y0QVU2YC', Clan::CLAN_TYPE_INVITE, 2,  'Galaxyguardians',  800,  Clan::WAR_FREQUENCY_ALWAYS,       10],
            ['#U0U0YCP',  Clan::CLAN_TYPE_INVITE, 7,  'game of rhones',   1100, Clan::WAR_FREQUENCY_ALWAYS,       116],
            ['#8U28UGQV', Clan::CLAN_TYPE_INVITE, 3,  'GOLD n SHOWERS',   1000, Clan::WAR_FREQUENCY_WEEKLY,       9],
            ['#2QV8LYP2', Clan::CLAN_TYPE_INVITE, 5,  'les chouquettes',  1600, Clan::WAR_FREQUENCY_ALWAYS,       82],
            ['#80R0RUUL', Clan::CLAN_TYPE_INVITE, 6,  'les subprimes',    1400, Clan::WAR_FREQUENCY_ALWAYS,       97],
            ['#2VCLRR2U', Clan::CLAN_TYPE_INVITE, 6,  'Lien Minh COC',    2100, Clan::WAR_FREQUENCY_ALWAYS,       84],
            ['#CYQ0C8G',  Clan::CLAN_TYPE_INVITE, 3,  'LOS PAY@S XXL',    1800, Clan::WAR_FREQUENCY_WEEKLY,       26],
            ['#P9UVQ0Y',  Clan::CLAN_TYPE_INVITE, 5,  'LosCareCompleto',  1800, Clan::WAR_FREQUENCY_TWICE_WEEKLY, 26],
            ['#PRPYPQR',  Clan::CLAN_TYPE_INVITE, 6,  'Meute Des Loups',  1000, Clan::WAR_FREQUENCY_WEEKLY,       97],
            ['#8JR8G8L9', Clan::CLAN_TYPE_INVITE, 4,  'New World 9',      1000, Clan::WAR_FREQUENCY_WEEKLY,       55],
            ['#QLVJ092',  Clan::CLAN_TYPE_INVITE, 5,  'pinklove',         1600, Clan::WAR_FREQUENCY_ALWAYS,       99],
            ['#PRP2LJP',  Clan::CLAN_TYPE_INVITE, 3,  'Powers That Be',   1500, Clan::WAR_FREQUENCY_NOT_SET,      13],
            ['#9UJ8Q82P', Clan::CLAN_TYPE_INVITE, 8,  'Purple Savages',   1100, Clan::WAR_FREQUENCY_ALWAYS,       121],
            ['#L8RRJPQ',  Clan::CLAN_TYPE_INVITE, 6,  'Rasht Tick',       800,  Clan::WAR_FREQUENCY_ALWAYS,       88],
            ['#2VRU2V0L', Clan::CLAN_TYPE_INVITE, 5,  'Swiss Keks',       0,    Clan::WAR_FREQUENCY_ALWAYS,       51],
            ['#2QY8GQQ0', Clan::CLAN_TYPE_INVITE, 5,  'Sons of hanover',  800,  Clan::WAR_FREQUENCY_TWICE_WEEKLY, 35],
            ['#2LQCLR8V', Clan::CLAN_TYPE_INVITE, 6,  'The Mustards',     1500, Clan::WAR_FREQUENCY_ALWAYS,       73],
            ['#8V9GGJPY', Clan::CLAN_TYPE_INVITE, 6,  'The Roughnecks',   2400, Clan::WAR_FREQUENCY_ALWAYS,       82],
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
          [ # Belgium at war
            ['#PCPQQLVJ',   104,  'Brittora',       @clans['#2CQ900RU']],
            ['#LJQQ8VC',    135,  'Gijs',           @clans['#2CQ900RU']],
            ['#2QRYUG2L',   74,   'kabouterlui',    @clans['#2CQ900RU']],
            ['#YG88R2JY',   98,   'killer',         @clans['#2CQ900RU']],
            ['#Y8VLPQ0J',   100,  'KurdyMalloy232', @clans['#2CQ900RU']],
            ['#22YCPRQJU',  77,   'kwasibelg',      @clans['#2CQ900RU']],
            ['#80L9G28Y',   119,  'Pêchon',         @clans['#2CQ900RU']],
            ['#828JPJ9Y',   43,   'lil\'glad',      @clans['#2CQ900RU']],
            ['#R22YV9QU',   88,   'rupss',          @clans['#2CQ900RU']],
            ['#8CQJR0YL',   73,   'sander',         @clans['#2CQ900RU']],
            ['#VQ9QVGC',    93,   'Seb Vb',         @clans['#2CQ900RU']],
            ['#PJYQYP0R',   92,   'Shadow',         @clans['#2CQ900RU']],
            ['#LLQ9QVYV',   99,   'slappe hap',     @clans['#2CQ900RU']],
            ['#YUY0PLVY',   116,  'SNeakyFreak36',  @clans['#2CQ900RU']],
            ['#299QU0UUC',  92,   'utopia',         @clans['#2CQ900RU']],
            
            # cep 2
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

            # Devils Rejects
            ['#208VRY09L',  82,   'andy',             @clans['#P9LQJQ9C']],
            ['#P8QV0GGC',   114,  'Gaerith',          @clans['#P9LQJQ9C']],
            ['#2QR2VP8Q2',  70,   'lonewolf',         @clans['#P9LQJQ9C']],
            ['#J2LRYRCR',   86,   'Lord Satoryn',     @clans['#P9LQJQ9C']],
            ['#2L0QL2JY9',  91,   'marn',             @clans['#P9LQJQ9C']],
            ['#Q0VYUPL9',   88,   'McFletchface',     @clans['#P9LQJQ9C']],
            ['#200CPRQR9',  78,   'nikola',           @clans['#P9LQJQ9C']],
            ['#V2LC02VV',   56,   'PoppyAndCocoa',    @clans['#P9LQJQ9C']],
            ['#QPJL9PPQ',   111,  'scocon',           @clans['#P9LQJQ9C']],
            ['#LJ88JJ22',   73,   'seductiveslayer',  @clans['#P9LQJQ9C']],
            
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

            # Elite Hamburg
            ['#82RVY0QLV',  64,   'cano',             @clans['#JPYUJRC']],
            ['#22VLVCC2L',  82,   'Drax',             @clans['#JPYUJRC']],
            ['#2V2Q2Q09V',  54,   'EliteEnno 21147',  @clans['#JPYUJRC']],
            ['#JJY8P8U8',   103,  'Elite-HH-Luis',    @clans['#JPYUJRC']],
            ['#8GJ9QVPG',   88,   'fis',              @clans['#JPYUJRC']],
            ['#CGGULVQ',    103,  'OG $ Gerle47',     @clans['#JPYUJRC']],
            ['#28VY9G80Q',  100,  'OG_Igor47',        @clans['#JPYUJRC']],
            ['#YJ9RLURU',   78,   'lolo',             @clans['#JPYUJRC']],
            ['#8L89R8C0',   131,  'Mummdolf',         @clans['#JPYUJRC']],
            ['#820QVVRC2',  71,   'skunk',            @clans['#JPYUJRC']],
            
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

            # game of rhones
            ['#LRYPLGUG',   80,   'Blivanos',         @clans['#U0U0YCP']],
            ['#98YQP98G',   120,  'djagwer',          @clans['#U0U0YCP']],
            ['#2QLQYYU0',   129,  'hodor',            @clans['#U0U0YCP']],
            ['#VLU92QR0',   76,   'Jon-Snow',         @clans['#U0U0YCP']],
            ['#22QCUJVYV',  100,  'Kenpachi',         @clans['#U0U0YCP']],
            ['#GL2CJV09',   95,   'Mabric',           @clans['#U0U0YCP']],
            ['#289RGGJGU',  84,   'Pierro 8',         @clans['#U0U0YCP']],
            ['#20UPPCPL9',  117,  'thomas',           @clans['#U0U0YCP']],
            ['#C8CQ8GJP',   102,  'tiguidou',         @clans['#U0U0YCP']],
            ['#2GP9Y9LJ0',  73,   '...mat...',        @clans['#U0U0YCP']],

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
            
            # les subprimes
            ['#GR8PC8LC',   115,  'alf',              @clans['#80R0RUUL']],
            ['#9UGGR0CQ',   74,   'julien',           @clans['#80R0RUUL']],
            ['#GYVQVGCP',   63,   'Maitre Clasheur',  @clans['#80R0RUUL']],
            ['#YGJP0PU',    152,  'mickael',          @clans['#80R0RUUL']],
            ['#9GGCPLQL',   112,  'snoopyx',          @clans['#80R0RUUL']],
            ['#PPLR9R9R',   105,  'Vaako',            @clans['#80R0RUUL']],
            ['#9P2CRRVY',   110,  '( Kiff28 )',       @clans['#80R0RUUL']],
            ['#C92C9CUR',   100,  '+{toma}+',         @clans['#80R0RUUL']],
            ['#20VJYCR2',   137,  '+-[dragib]-+',     @clans['#80R0RUUL']],
            
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

            # Meute Des Loups
            ['#9QJY9GQJ',   135,  'JFC67',              @clans['#PRPYPQR']],
            ['#JV09PPV0',   83,   'kakss',              @clans['#PRPYPQR']],
            ['#RVJJJ8PC',   104,  'Manu-Seltz67',       @clans['#PRPYPQR']],
            ['#RJ9VQC8Q',   72,   'Manu67',             @clans['#PRPYPQR']],
            ['#LRL02J',     86,   'maomakmak',          @clans['#PRPYPQR']],
            ['#892YG29CL',  49,   'Marc6793',           @clans['#PRPYPQR']],
            ['#8QJ2JVRL',   88,   'Marie&Tobias',       @clans['#PRPYPQR']],
            ['#G8GJJUJG',   119,  'Stefdu68 Sicile',    @clans['#PRPYPQR']],
            ['#JYVP20RY',   103,  'Sarah',              @clans['#PRPYPQR']],
            ['#2GL8P0QL',   104,  'weed',               @clans['#PRPYPQR']],

            # New World 9
            ['#RCQ0J0JR',   100,  'agent_chu',        @clans['#8JR8G8L9']],
            ['#8LYRQ8Y',    105,  'alexander',        @clans['#8JR8G8L9']],
            ['#YV2J2028',   89,   'andrew rampant',   @clans['#8JR8G8L9']],
            ['#9GRJQV82',   73,   'Bgeleyns',         @clans['#8JR8G8L9']],
            ['#LLVCLU2G',   91,   'charliedeuce',     @clans['#8JR8G8L9']],
            ['#R0U289PJ',   93,   'Chief bigdik',     @clans['#8JR8G8L9']],
            ['#L9QJ2JYQ',   100,  'Chromatomic',      @clans['#8JR8G8L9']],
            ['#PQVUJ2PR',   97,   'Count Dubula',     @clans['#8JR8G8L9']],
            ['#228Q28RUG',  86,   'Craig',            @clans['#8JR8G8L9']],
            ['#PV0LJJU0',   99,   'Dan',              @clans['#8JR8G8L9']],
            ['#LP2YRGG0',   65,   'Destiny_Void',     @clans['#8JR8G8L9']],
            ['#CRCY2QY0',   87,   'DraggQu33n',       @clans['#8JR8G8L9']],
            ['#QQ29RU8L',   86,   'HermanTheGerman',  @clans['#8JR8G8L9']],
            ['#22Q2L92V2',  63,   'hershbar',         @clans['#8JR8G8L9']],
            ['#RY9LYY0P',   85,   'king',             @clans['#8JR8G8L9']],
            ['#R20YLVUP',   132,  'LeviUnderwood5',   @clans['#8JR8G8L9']],
            ['#RVJ08JR2',   103,  'Marian 2.0',       @clans['#8JR8G8L9']],
            ['#8Y2V2Q09',   112,  'munchbar',         @clans['#8JR8G8L9']],
            ['#8CLR8V2G',   65,   'NEFF',             @clans['#8JR8G8L9']],
            ['#CPG2L0YV',   62,   'Nunu',             @clans['#8JR8G8L9']],
            ['#2228PY9QC',  95,   'O.P. Slim',        @clans['#8JR8G8L9']],
            ['#GY9YL809',   85,   'ponikz',           @clans['#8JR8G8L9']],
            ['#2YUYU2GJG',  83,   'SAM',              @clans['#8JR8G8L9']],
            ['#9PQ2LV8L',   90,   'silence',          @clans['#8JR8G8L9']],
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

            # Purple Savages
            ['#202LR8G2',   87,   'Hercules',         @clans['#9UJ8Q82P']],
            ['#PUUJU92G',   109,  'Lady Caitlin',     @clans['#9UJ8Q82P']],
            ['#RLUCLUGP',   127,  'Marty McFly',      @clans['#9UJ8Q82P']],
            ['#QGYQJRUV',   116,  'Purple Savage',    @clans['#9UJ8Q82P']],
            ['#28CL8V9R2',  70,   'ramz',             @clans['#9UJ8Q82P']],
            ['#LU8RP8Q2',   106,  'Raulito',          @clans['#9UJ8Q82P']],
            ['#2PPCLV28J',  70,   'remy86',           @clans['#9UJ8Q82P']],
            ['#99CLQ8YC',   110,  'RENE(956)',        @clans['#9UJ8Q82P']],
            ['#PQ8GJ9CG',   101,  'Sir Kevin',        @clans['#9UJ8Q82P']],
            ['#22VGGUCG',   112,  '-Paradise-',       @clans['#9UJ8Q82P']],

            # Rasht Tick
            ['#UUUVYJGG',   108,  'Ali_viper',        @clans['#L8RRJPQ']],
            ['#CLQGQVG2',   122,  'farzan',           @clans['#L8RRJPQ']],
            ['#92G8QG8Y',   83,   'fooriii',          @clans['#L8RRJPQ']],
            ['#V9Q2V2J2',   79,   'Ladis_94',         @clans['#L8RRJPQ']],
            ['#GJ9LUQC8',   122,  'makan',            @clans['#L8RRJPQ']],
            ['#202VGUP9L',  101,  'Meisam',           @clans['#L8RRJPQ']],
            ['#LV8QYQVP',   87,   'Melika',           @clans['#L8RRJPQ']],
            ['#YYPC0P8Y',   85,   'Niloofar',         @clans['#L8RRJPQ']],
            ['#8Q8JYQ8',    109,  'peyman',           @clans['#L8RRJPQ']],
            ['#G8UCCC88',   89,   'TOJJAR',           @clans['#L8RRJPQ']],
            
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
            
            # The Mustards
            ['#YU0J0QU9',   93,   'AbbysDad',         @clans['#2LQCLR8V']],
            ['#Y9R28C2C',   125,  'BiggDaddy',        @clans['#2LQCLR8V']],
            ['#G9JJVQY2',   80,   'Bighags32',        @clans['#2LQCLR8V']],
            ['#9PVQVC28',   122,  'christian',        @clans['#2LQCLR8V']],
            ['#U9J9G9YR',   81,   'hags32',           @clans['#2LQCLR8V']],
            ['#28R00LC8Q',  69,   'magnificent ASH',  @clans['#2LQCLR8V']],
            ['#CJJ2YQU',    101,  'MStone12',         @clans['#2LQCLR8V']],
            ['#8QV9UG99',   52,   'NoahTheGamer326',  @clans['#2LQCLR8V']],
            ['#2898LVQJQ',  98,   'WhoSharted84',     @clans['#2LQCLR8V']],
            ['#2RQY9V9',    107,  'YAB',              @clans['#2LQCLR8V']],

            # The Roughnecks
            ['#QR2R8RRU',   125,  'ace',              @clans['#8V9GGJPY']],
            ['#8R99LQL8',   84,   'armybaptist',      @clans['#8V9GGJPY']],
            ['#90UQPJ2L',   99,   'BigEarnMcCraken',  @clans['#8V9GGJPY']],
            ['#9U0YRPU',    102,  'bowhunter',        @clans['#8V9GGJPY']],
            ['#9CCR29J8',   96,   'Casso',            @clans['#8V9GGJPY']],
            ['#PY0Q2QLQ',   104,  'chocothunda',      @clans['#8V9GGJPY']],
            ['#VPPLYG9C',   59,   'Ford Killer',      @clans['#8V9GGJPY']],
            ['#20LP98PLU',  83,   'Lexiiii19',        @clans['#8V9GGJPY']],
            ['#2YYUUC9R',   121,  'puddin597',        @clans['#8V9GGJPY']],
            ['#P8UPGLGC',   84,   'Sir Ronald',       @clans['#8V9GGJPY']],
            

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

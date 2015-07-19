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
          [ ['#8YGC2RRV', Clan::CLAN_TYPE_INVITE, 5,  'Doguimie',         1800, Clan::WAR_FREQUENCY_ALWAYS, 92],
            ['#Y0QVU2YC', Clan::CLAN_TYPE_INVITE, 2,  'Galaxyguardians',  800,  Clan::WAR_FREQUENCY_ALWAYS, 10],
            ['#CYQ0C8G',  Clan::CLAN_TYPE_INVITE, 3,  'LOS PAY@S XXL',    1800, Clan::WAR_FREQUENCY_WEEKLY, 26],
            ['#8JR8G8L9', Clan::CLAN_TYPE_ANYONE, 3,  'New World 9',      1700, Clan::WAR_FREQUENCY_WEEKLY, 40],
            ['#QLVJ092',  Clan::CLAN_TYPE_INVITE, 5,  'pinklove',         1600, Clan::WAR_FREQUENCY_ALWAYS, 99]
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
          [ # Doguimie<heart>
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

            # New World 9
            ['#RCQ0J0JR', 85,   'agent_chu',        @clans['#8JR8G8L9']],
            ['#8LYRQ8Y',  105,  'alexander',        @clans['#8JR8G8L9']],
            ['#YV2J2028', 89,   'andrew rampant',   @clans['#8JR8G8L9']],
            ['#LLVCLU2G', 91,   'charliedeuce',     @clans['#8JR8G8L9']],
            ['#L9QJ2JYQ', 86,   'Chromatomic',      @clans['#8JR8G8L9']],
            ['#PQVUJ2PR', 85,   'Count Dubula',     @clans['#8JR8G8L9']],
            ['#PV0LJJU0', 91,   'Dan',              @clans['#8JR8G8L9']],
            ['#QQ29RU8L', 86,   'HermanTheGerman',  @clans['#8JR8G8L9']],
            ['#R20YLVUP', 120,  'LeviUnderwood5',   @clans['#8JR8G8L9']],
            ['#RVJ08JR2', 103,  'Marian 2.0',       @clans['#8JR8G8L9']],
            ['#CPG2L0YV', 47,   'Nunu',             @clans['#8JR8G8L9']],
            ['#GY9YL809', 85,   'ponikz',           @clans['#8JR8G8L9']],
            ['#9PQ2LV8L', 80,   'silence',          @clans['#8JR8G8L9']],
            ['#Y2U2Q20G', 99,   'staphnie',         @clans['#8JR8G8L9']],
            ['#QQUUCVVL', 67,   'TOOL55BOX',        @clans['#8JR8G8L9']],
            ['#G28VPUR',  91,   'wicked defense',   @clans['#8JR8G8L9']],
            ['#P9VVGU9J', 83,   '*a 83*',           @clans['#8JR8G8L9']],

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
            ['#2Y28LR9U',   88,   '_Daisa',           @clans['#QLVJ092']]
            
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
          puts "attempting player creation for coc_id '#{data[0]}', level '#{data[1]}', and name '#{data[3]}'"
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

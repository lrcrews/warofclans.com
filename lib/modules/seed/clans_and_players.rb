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
          [ ['#8JR8G8L9', Clan::CLAN_TYPE_ANYONE, 3, 'New World 9', 1700, Clan::WAR_FREQUENCY_WEEKLY, 40],
            ['#QLVJ092',  Clan::CLAN_TYPE_INVITE, 5, 'pinklove',    1600, Clan::WAR_FREQUENCY_ALWAYS, 99]
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
            puts "WARNING:  clan of coc_id '#{data[0]}' already exists."
          end
          @clans[clan.coc_id] = clan
        end


        def create_players
          current_player_count = Player.all.count
          puts "____________________"
          puts "adding players to the existing #{current_player_count} player(s)..."
          # This list is arranged alphabetically by the clan name (in comment), then 
          # by "name" column (data[2])
          #
          [ # pinklove
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
            ['#JJLY8RCJ',   78,   'Sheisuke',         @clans['#QLVJ092']],
            ['#YGPYQ209',   82,   'vichka',           @clans['#QLVJ092']],
            ['#2280C2UQV',  92,   'VitLoveLin',       @clans['#QLVJ092']],
            ['#2Y28LR9U',   88,   '_Daisa',           @clans['#QLVJ092']],
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
            ['#P9VVGU9J', 83,   '*a 83*',           @clans['#8JR8G8L9']]
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
            puts "WARNING:  player of coc_id '#{data[0]}' already exists."
          end
        end

    end

  end
end

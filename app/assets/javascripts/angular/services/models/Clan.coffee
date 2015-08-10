'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("Clan",  ->
    
  class Clan
    
    constructor: (json={}) ->
      @coc_id               = json.coc_id ? ""
      @clan_type            = json.clan_type ? ""
      @created_at           = json.created_at ? ""
      @id                   = json.id ? null
      @level                = json.level ? null
      @name                 = json.name ? ""
      @player_count         = json.player_count ? null
      @required_trophies    = json.required_trophies ? null
      @updated_at           = json.updated_at ? ""
      @war_frequency        = json.war_frequency ? ""
      @wars_in_system_count = json.wars_in_system_count ? null
      @wars_won             = json.wars_won ? null

      @players              = json.players ? [] # will become Player.coffee objects
      @wars                 = json.wars ? []    # will become War.coffee objects

      # sometimes this will exist too (from clan_war)
      @team_size            = json.team_size ? null
      @war_stars_awarded    = json.war_stars_awarded ? null
      @winner               = json.winner ? null


    totalNotWins: ->
      notWins = @wars.length - @totalWins()


    totalWins: ->
      wins = 0
      wins += 1 for war in @wars when Clan.winnerCheck(war, this)
      wins

    winLossRatio: ->
      denominator = @totalNotWins()
      if denominator is 0
        denominator = 1
      @totalWins() / denominator


    @winnerCheck: (war, curiousClan) ->
      winner = (clan for clan in war.clans when clan.winner is true)[0]
      winner.coc_id is curiousClan.coc_id


    @clansFromJsonClans: (jsonClansArray) ->
      # Create class versions from json data
      new Clan(clan) for clan in jsonClansArray
      
)

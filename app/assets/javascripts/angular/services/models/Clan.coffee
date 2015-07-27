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
      @stars_earned         = json.stars_earned ? null
      @team_size            = json.team_size ? null
      @winner               = json.winner ? null


    @clans_from_json_clans: (json_clans_array) ->
      # Create class versions from json data
      new Clan(clan) for clan in json_clans_array
      
)

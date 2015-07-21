'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("Clan",  ->
    
  class Clan
    
    constructor: (json={}) ->
      @coc_id             = json.coc_id ? ""
      @clan_type          = json.clan_type ? ""
      @created_at         = json.created_at ? ""
      @id                 = json.id ? null
      @level              = json.level ? null
      @name               = json.name ? ""
      @required_trophies  = json.required_trophies ? null
      @updated_at         = json.updated_at ? ""
      @war_frequency      = json.war_frequency ? ""
      @wars_won           = json.wars_won ? null

      # sometimes this will exist too (from clan_war)
      @player_count       = json.player_count ? null
      @stars_earned       = json.stars_earned ? null
      @winner             = json.winner ? null


      # TODO: will add other stuff when I TDD this JSON


    @clans_from_json_clans: (json_clans_array) ->
      # Create class versions from json data
      new Clan(clan) for clan in json_clans_array
      
)

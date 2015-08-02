'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("Battle",  ->
    
  class Battle
    
    constructor: (json={}) ->
      @attacker_rank        = json.attacker_rank ? null
      @created_at           = json.created_at ? ""
      @defender_rank        = json.defender_rank ? null
      @destruction_percent  = json.destruction_percent ? null
      @id                   = json.id ? null
      @minutes_left_in_war  = json.minutes_left_in_war ? null
      @stars_awarded        = json.stars_awarded ? null
      @stars_earned         = json.stars_earned ? null
      @updated_at           = json.updated_at ? ""

      @attacker             = json.battles ? [] # will become Player.coffee objects
      @defender             = json.clans ? []   # will become Player.coffee objects
      @war                  = json.war ? {}     # will become War.coffee object


    @battlesFromJsonBattles: (jsonBattlesArray) ->
      # Create class versions from json data
      new Battle(battle) for battle in jsonBattlesArray
      
)

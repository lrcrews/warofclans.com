'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("Battle",  ->
    
  class Battle
    
    constructor: (json={}) ->
      @attacker_clan_coc_id           = json.attacker_clan_coc_id ? ""
      @attacker_earned_stars_for_clan = json.attacker_earned_stars_for_clan ? false
      @attacker_rank                  = json.attacker_rank ? null
      @attacker_victorious            = json.attacker_victorious ? false
      @created_at                     = json.created_at ? ""
      @defender_clan_coc_id           = json.defender_clan_coc_id ? ""
      @defender_rank                  = json.defender_rank ? null
      @destruction_percent            = json.destruction_percent ? null
      @id                             = json.id ? null
      @minutes_left_in_war            = json.minutes_left_in_war ? null
      @stars_awarded                  = json.stars_awarded ? null
      @updated_at                     = json.updated_at ? ""
      @war_stars_awarded              = json.war_stars_awarded ? null
      
      @attacker = json.attacker ? []  # will become Player.coffee objects
      @defender = json.defender ? []  # will become Player.coffee objects
      @war      = json.war ? {}       # will become War.coffee object


    timeLeftInWar: ->
      if @minutes_left_in_war?
        hours = Math.floor(@minutes_left_in_war / 60)
        hoursString = if hours > 0 then "#{hours}h " else ""
        minutesString = "#{@minutes_left_in_war % 60}m"
        "#{hoursString}#{minutesString}"
      else
        "???"


    @battlesFromJsonBattles: (jsonBattlesArray) ->
      # Create class versions from json data
      new Battle(battle) for battle in jsonBattlesArray
      
)

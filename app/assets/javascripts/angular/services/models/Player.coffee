'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("Player",  ->
    
  class Player
    
    constructor: (json={}) ->
      @attacks_won                      = json.attacks_won ? 0
      @attacks_won_with_war_stars       = json.attacks_won_with_war_stars ? 0
      @coc_id                           = json.coc_id ? ""
      @created_at                       = json.created_at ? ""
      @defences_won_completely          = json.defences_won_completely ? 0
      @defences_won_war_stars_defended  = json.defences_won_war_stars_defended ? 0
      @id                               = json.id ? null
      @level                            = json.level ? 0
      @name                             = json.name ? ""
      @stars                            = json.stars ? 0
      @stars_lost                       = json.stars_lost ? 0
      @total_attacks                    = json.total_attacks ? 0
      @total_defences                   = json.total_defences ? 0
      @war_stars                        = json.war_stars ? 0
      @war_stars_lost                   = json.war_stars_lost ? 0
      @updated_at                       = json.updated_at ? ""
      
      @attacks  = json.attacks ? [] # will become array of Battle.coffee objects
      @defences = json.defences ? [] # will become array of Battle.coffee objects
      @clans    = json.clans ? []   # will become array of Clan.coffee objects


    defenceLossRatio: ->
      @defences_won_completely / @_denominatorFrom(@total_defences)

    starsLostPerDefence: ->
      @stars_lost / @_denominatorFrom(@total_defences)

    starsPerAttack: ->
      @stars / @total_attacks

    warStarsLostPerDefence: ->
      @war_stars_lost / @_denominatorFrom(@total_defences)

    warStarsPerAttack: ->
      @war_stars / @total_attacks

    winLossRatio: ->
      @attacks_won / @_denominatorFrom(@total_attacks - @attacks_won)


    # TODO: can I make private methods?
    _denominatorFrom: (value) ->
      if value < 1
        value = 1
      value


    @playersFromJsonPlayers: (jsonPlayersArray) ->
      # Create class versions from json data
      new Player(player) for player in jsonPlayersArray
      
)

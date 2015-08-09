'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.factory("War",  ->
    
  class War
    
    constructor: (json={}) ->
      @battle_count = json.battle_count ? 0
      @created_at   = json.created_at ? ""
      @id           = json.id ? null
      @updated_at   = json.updated_at ? ""
      @war_date     = json.war_date ? ""

      @battles      = json.battles ? [] # will become array of Battle.coffee objects
      @clans        = json.clans ? []   # will become array of Clan.coffee objects


    attacksByPlayers: (playerCocIds) ->
      (battle for battle in @battles when battle.attacker.coc_id in playerCocIds)


    clanOfCocId: (cocId) ->
      (clan for clan in @clans when clan.coc_id is cocId)[0]


    clanNotOfCocId: (cocId) ->
      (clan for clan in @clans when clan.coc_id isnt cocId)[0]


    winner: ->
      if @clans[0]?.winner == true then @clans[0] else @clans[1]


    notWinner: ->
      if @clans[0]?.winner == true then @clans[1] else @clans[0]


    @isWinner: (war, cocId) ->
      war.winner()["coc_id"] is cocId

    @warsFromJsonWars: (jsonWarsArray) ->
      # Create class versions from json data
      new War(war) for war in jsonWarsArray
      
)

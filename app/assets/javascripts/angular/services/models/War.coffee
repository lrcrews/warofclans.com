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

      @battles      = json.battles ? []
      @clans        = json.clans ? []


    winner: ->
      if @clans[0]?.winner == true then @clans[0] else @clans[1]

    not_winner: ->
      if @clans[0]?.winner == true then @clans[1] else @clans[0]


    @wars_from_json_wars: (json_wars_array) ->
      # Create class versions from json data
      new War(war) for war in json_wars_array
      
)

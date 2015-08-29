"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("WarController",
  [ "$scope", "Battle", "Clan", "Player", "War", 
  (  $scope,   Battle,   Clan,   Player,   War ) ->

    $scope.war = new War(gon.war)

    $scope.activeTab = "battles"
    $scope.setActiveTab = (value) ->
      $scope.activeTab = value
    
    $scope.initialize = ->
      console.log("hello war.")
      clan.active = true for clan in $scope.war.clans
      $scope.war.battles = Battle.battlesFromJsonBattles($scope.war.battles)
      _setUpBattleData(battle) for battle in $scope.war.battles

    _setUpBattleData = (battle) ->
      battle.attacker = new Player(battle.attacker)
      battle.attacker.clans = [ $scope.war.clanOfCocId(battle.attacker_clan_coc_id) ]
      battle.defender = new Player(battle.defender)
      battle.defender.clans = [ $scope.war.clanOfCocId(battle.defender_clan_coc_id) ]

  ])

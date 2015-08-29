"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("PlayerController",
  [ "$scope", "Battle", "Clan", "Player", 
  (  $scope,   Battle,   Clan,   Player ) ->

    $scope.player = new Player(gon.player)

    $scope.activeTab = "attacks"
    $scope.setActiveTab = (value) ->
      $scope.activeTab = value
    
    $scope.initialize = ->
      console.log("hello player.")
      # Clan.coffee stuff
      $scope.player.clans = Clan.clansFromJsonClans($scope.player.clans)
      # Battle.coffee stuff
      $scope.player.attacks = _setUpBattles($scope.player.attacks)
      $scope.player.defences = _setUpBattles($scope.player.defences)

    _setUpBattles = (battles) ->
      battles = Battle.battlesFromJsonBattles(battles)
      _setUpPlayers(battle) for battle in battles
      battles

    _setUpPlayers = (battle) ->
      battle.attacker = _setUpPlayer(battle.attacker)
      battle.defender = _setUpPlayer(battle.defender)

    _setUpPlayer = (player) ->
      if player?.coc_id is $scope.player?.coc_id
        $scope.player
      else
        new Player(player)

  ])

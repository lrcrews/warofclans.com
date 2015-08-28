"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("WarController",
  [ "$scope", "Battle", "Clan", "War", 
  (  $scope,   Battle,   Clan,   War ) ->

    $scope.war = new War(gon.war)
    
    $scope.initialize = ->
      console.log("hello war.")
      $scope.war.battles = Battle.battlesFromJsonBattles($scope.war.battles)

  ])

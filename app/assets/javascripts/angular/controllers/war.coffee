"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("WarController",
  [ "$scope", "Battle", "War", 
  ( $scope, Battle, War ) ->

    $scope.war = new War(gon.war)
    
    $scope.initialize = ->
      console.log("hello war.")
      $scope.war.battles = Battle.battles_from_json_battles($scope.war.battles)

  ])

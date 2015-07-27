"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("ClanController",
  [ "$scope", "Clan", "War", 
  ( $scope, Clan, War ) ->

    $scope.clan = new Clan(gon.clan)
    
    $scope.initialize = ->
      console.log("hello clan.")
      $scope.clan.wars = War.wars_from_json_wars($scope.clan.wars)

  ])

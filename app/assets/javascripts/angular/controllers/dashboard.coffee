"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("DashboardController",
  [ "$scope", "Clan", "War", 
  ( $scope, Clan, War ) ->

    $scope.wars = War.wars_from_json_wars(gon.wars)
    
    $scope.initialize = ->
      console.log("hello dashboard.")
      for war in $scope.wars
        war.clans = Clan.clans_from_json_clans(war.clans)


  ])

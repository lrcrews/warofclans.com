"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("DashboardController",
  [ "$scope", "Clan", "War", 
  ( $scope, Clan, War ) ->

    $scope.wars = War.warsFromJsonWars(gon.wars)
    
    $scope.initialize = ->
      console.log("hello dashboard.")
      for war in $scope.wars
        war.clans = Clan.clansFromJsonClans(war.clans)

  ])

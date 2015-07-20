"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("DashboardController",
  [ "$scope", "War", 
  ( $scope, War ) ->

    $scope.wars = War.wars_from_json_wars(gon.wars)
    
    $scope.initialize = ->
      console.log("hello dashboard.")


  ])

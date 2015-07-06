"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("DashboardController",
  [ "$scope", 
  ( $scope ) ->

    $scope.wars = gon.wars
    
    $scope.initialize = ->
      console.log("hello dashboard.")
      console.log("wars: #{$scope.wars}")


  ])

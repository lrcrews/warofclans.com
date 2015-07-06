"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("SiteController",
  [ "$scope", "$window", 
  ( $scope,   $window) ->

    
    $scope.initialize = ->
      console.log("hello site.")


  ])

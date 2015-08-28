"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("SiteController",
  [ "$scope", 
  (  $scope ) ->

    $scope.windowLocation = (url) ->
      window.location = url
    
    $scope.initialize = ->
      console.log("hello site.")


  ])

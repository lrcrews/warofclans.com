"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("DashboardController",
  [ "$scope", "$http", "Clan", "CSRF", "War", 
  (  $scope,   $http,   Clan,   CSRF,   War ) ->

    _self = this

    $scope.betaEmail = null
    $scope.betaEmailSubmitted = false

    $scope.wars = War.warsFromJsonWars(gon.wars)

    $scope.signUpBetaInterest = ->
      if $scope.betaEmail != null
        CSRF.setCSRFHeader()
        $http.post('/register_interest', {"beta_email": $scope.betaEmail}).success(_self.interestSuccess)

    _self.interestSuccess = (data, status) ->
      console.log("thanks awesome internet person!")
      $scope.betaEmailSubmitted = true
    
    $scope.initialize = ->
      console.log("hello dashboard.")
      for war in $scope.wars
        war.clans = Clan.clansFromJsonClans(war.clans)

  ])

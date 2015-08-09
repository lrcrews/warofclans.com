"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("ClanController",
  [ "$scope", "Clan", "War", 
  ( $scope, Clan, War ) ->

    $scope.clan = new Clan(gon.clan)


    $scope.isWinnerOf = (war) ->
      War.isWinner(war, $scope.clan.coc_id)

    $scope.warClan = (war) ->
      war.clanOfCocId($scope.clan.coc_id)

    $scope.warClanOpponent = (war) ->
      war.clanNotOfCocId($scope.clan.coc_id)

    $scope.warClanAttacks = (war) ->
      war.attacksByPlayers($scope.clan.players.map (player) -> player.coc_id).length

    $scope.warClanAttackRatio = (war) ->
      attacks = $scope.warClanAttacks(war)
      possibleAttacks = $scope.warClanAttacksPossible(war)
      (attacks / possibleAttacks) * 100

    $scope.warClanAttacksPossible = (war) ->
      $scope.warClan(war).team_size * 2

    $scope.warClanStarsEarnedRatio = (war) ->
      starsEarned = $scope.warClan(war).stars_earned
      possibleStars = $scope.warClanStarsPossible(war)
      (starsEarned / possibleStars) * 100

    $scope.warClanStarsPossible = (war) ->
      $scope.warClan(war).team_size * 3

    $scope.activeTab = "wars"
    $scope.setActiveTab = (value) ->
      $scope.activeTab = value
    
    $scope.initialize = ->
      console.log("hello clan.")
      $scope.clan.wars = War.warsFromJsonWars($scope.clan.wars)

  ])

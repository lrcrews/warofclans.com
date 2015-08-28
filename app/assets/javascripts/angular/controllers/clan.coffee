"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers")

warOfClansAppControllersModule.controller("ClanController",
  [ "$scope", "Clan", "Player", "War", 
  (  $scope,   Clan,   Player,   War ) ->

    $scope.clan = new Clan(gon.clan)

    $scope.activeTab = "wars"
    $scope.setActiveTab = (value) ->
      $scope.activeTab = value

    # War Tab Stuff
    # TODO: maybe: break out some child controllers for the partials, having
    #       this parent controller just handling things for the page as a whole

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
      starsEarned = $scope.warClan(war).war_stars_awarded
      possibleStars = $scope.warClanStarsPossible(war)
      (starsEarned / possibleStars) * 100

    $scope.warClanStarsPossible = (war) ->
      $scope.warClan(war).team_size * 3

    # Player Tab Stuff

    

    # The mighty mighty boss method
    
    $scope.initialize = ->
      console.log("hello clan.")
      $scope.clan.wars = War.warsFromJsonWars($scope.clan.wars)
      $scope.clan.players = Player.playersFromJsonPlayers($scope.clan.players)

  ])

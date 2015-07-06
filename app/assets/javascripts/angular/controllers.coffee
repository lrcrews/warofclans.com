"use strict"

warOfClansAppControllersModule = angular.module("warOfClansApp.controllers", [])

warOfClansAppControllersModule.config([ "$httpProvider",
  ($httpProvider) ->
    # This header is required for all Ajax requests.
    $httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"
  ])

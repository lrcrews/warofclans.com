'use strict'

warOfClansAppServicesModule = angular.module("warOfClansApp.services")

warOfClansAppServicesModule.service("CSRF", 
  [ "$http", "$cookies", ($http, $cookies) ->
    
    csrfObject = {}
    csrfObject.setCSRFHeader = ->
      $http.defaults.headers.common["X-CSRF-Token"] = $cookies["csrf"]
    csrfObject
    
  ])

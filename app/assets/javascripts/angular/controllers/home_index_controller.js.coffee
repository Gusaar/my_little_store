homeIndexCtrl = angular.module 'homeIndexCtrl', [ 'itemService', 'itemDirectives' ]

homeIndexCtrl.controller 'homeIndexCtrl', ['$scope', '$location', 'itemService', ($scope, $location, itemService) ->
  $scope.items = []

  $scope.loadAll = ->
    itemService.all().then (items) ->
      $scope.items = items
      return
  $scope.loadAll()

  $scope.redirectNew = ->
    $location.url('/items/new')
]
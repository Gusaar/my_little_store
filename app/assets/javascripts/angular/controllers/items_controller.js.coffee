itemsCtrl = angular.module 'itemsCtrl', [ 'itemDirectives' ]

itemsCtrl.controller 'itemsCtrl', [ '$scope', '$location', '$routeParams', 'itemService', ($scope, $location, $routeParams, itemService)->
  $scope.item = {}

  $scope.itemInitializer = ->
    $scope.item = {
      name: ''
      price: ''
      description: ''
    }
  $scope.itemInitializer()

  $scope.showItem = (itemId) ->
    $location.url('/items/' + itemId)

  $scope.redirectEdit = (itemId) ->
    $location.url('/items/' + itemId + '/edit')

  $scope.getItem = (itemId) ->
    itemService.findById(itemId).then (item) ->
      $scope.item = item
      return
  if $routeParams? && $routeParams.id?
    $scope.getItem($routeParams.id)

  $scope.clearForm = ->
    $scope.itemInitializer()

  $scope.createItem = ->
    itemService.create($scope.item).then (item) ->
      if item.id
        $location.url('/items/' + item.id)

  $scope.updateItem = ->
    itemService.update($scope.item).then (item) ->
      $location.url('/items/' + item.id)

  $scope.destroyItem = (itemId) ->
    itemService.destroy(itemId).then (data) ->
      $location.url('/items')

]
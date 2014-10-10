modalCtrl = angular.module 'modalCtrl', []

modalCtrl.controller 'modalCtrl', [ '$scope', '$modalInstance', ($scope, $modalInstance, itemId) ->
  $scope.cancel = ->
    $modalInstance.dismiss()

  $scope.yes = ->
    $modalInstance.close()
]
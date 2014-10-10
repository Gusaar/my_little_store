modalCtrl = angular.module 'modalCtrl', [ 'ngSanitize' ]

modalCtrl.controller 'modalCtrl', [ '$scope', '$modalInstance', 'modalTitle', 'modalBody', 'modalFooter', ($scope, $modalInstance, modalTitle, modalBody, modalFooter) ->
  $scope.title = modalTitle
  $scope.body = modalBody
  $scope.footer = modalFooter
  $scope.name = ""

  $scope.cancel = ->
    $modalInstance.dismiss()

  $scope.yes = ->
    $modalInstance.close()

]
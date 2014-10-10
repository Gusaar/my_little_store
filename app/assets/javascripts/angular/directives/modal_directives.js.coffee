modalDirectives = angular.module 'modalDirectives', [ 'modalCtrl' ]

modalDirectives.directive 'deleteButton', [ '$modal', ($modal) ->
  restrict: 'E'
  template: '<button class="btn btn-default pull-right" ng-click="open()">Delete</button>'
  link: (scope, elem, attrs) ->
    scope.open = ->
      modalInstance = $modal.open({
        templateUrl: '../assets/shared/_delete_modal.html'
        controller: 'modalCtrl'
        size: 'sm'
        resolve: {
          modalTitle: ->
            'Warning'
          modalBody: ->
            'Are you sure that you want to delete it?'
          modalFooter: ->
            ''
        }
      })

      modalInstance.result.then ->
        scope.destroyItem(scope.item.id)
]
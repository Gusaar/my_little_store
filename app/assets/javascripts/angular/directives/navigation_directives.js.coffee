navigationDirectives = angular.module 'navigationDirectives', [ 'navigationBarCtrl' ]

navigationDirectives.directive 'navigationBar', [ ->
  restrict: 'E'
  templateUrl: '../assets/navigation/bar.html'
  controller: 'navigationBarCtrl'
  replace: true
]
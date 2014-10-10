itemDirectives = angular.module 'itemDirectives', [ ]

itemDirectives.directive 'showItem', [ ->
  restrict: 'E'
  templateUrl: '../assets/items/_item.html'
  replace: true
]

itemDirectives.directive 'itemForm', [ ->
  restrict: 'E'
  templateUrl: '../assets/items/_form.html'
  replace: true
]

itemDirectives.directive 'itemNavigationBar', [ ->
  restrict: 'E'
  templateUrl: '../assets/items/_navigation_bar.html'
  replace: true
]
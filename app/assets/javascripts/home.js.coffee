# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_tree ./angular/controllers
#= require_tree ./angular/directives
#= require_tree ./angular/services

app = angular.module 'little-store', [ 'ngRoute', 'homeIndexCtrl', 'itemsCtrl', 'navigationDirectives' ]

app.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/', { templateUrl: '../assets/home/index.html', controller: 'homeIndexCtrl' })
    .when('/items', { templateUrl: '../assets/home/index.html', controller: 'homeIndexCtrl' })
    .when('/items/new', { templateUrl: '../assets/items/new.html', controller: 'itemsCtrl' })
    .when('/items/:id', { templateUrl: '../assets/items/show.html', controller: 'itemsCtrl' })
    .when('/items/:id/edit', templateUrl: '../assets/items/edit.html', controller: 'itemsCtrl')
    .otherwise({redirectTo: '/'})
]

app.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
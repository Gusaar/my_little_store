itemService = angular.module 'itemService', []

itemService.factory 'itemService', [ '$http', '$q', ($http, $q) ->
  all: ->
    self = this
    deferred = $q.defer()
    $http { url: '/items', method: 'GET' }
      .success( (data) ->
        deferred.resolve(data.items)
        return
      )
      .error (data, status, header, config) ->
        deferred.reject(self.handleError(data, status, header, config))
    deferred.promise

  findById: (itemId) ->
    self = this
    deferred = $q.defer()
    $http { url: '/items/' + itemId, method: 'GET' }
      .success( (data) ->
        deferred.resolve(data.item)
        return
      )
      .error (data, status, header, config) ->
        deferred.reject(self.handleError(data, status, header, config))
    deferred.promise

  create: (data) ->
    self = this
    deferred = $q.defer()
    $http { url: '/items', method: 'POST', data: data}
      .success ( (data) ->
        deferred.resolve(data.item)
        return
      )
      .error (data, status, header, config) ->
        deferred.reject(self.handleError(data, status, header, config))
    deferred.promise

  update: (data) ->
    self = this
    deferred = $q.defer()
    $http { url: '/items/' + data.id, method: 'PATCH', data: data}
      .success ( (data) ->
        deferred.resolve(data.item)
        return
      )
      .error (data, status, header, config) ->
        deferred.reject(self.handleError(data, status, header, config))
    deferred.promise

  destroy: (itemId) ->
    self = this
    deferred = $q.defer()
    $http { url: '/items/' + itemId, method: 'DELETE', data: itemId}
      .success ( (data) ->
        deferred.resolve(data)
        return
      )
      .error (data, status, header, config) ->
        deferred.reject(self.handleError(data, status, header, config))
    deferred.promise

  handleError: (data, status, header, config) ->
    {
      data:data, 
      status: status,
      headers: header, 
      config: config
    }
    return

]
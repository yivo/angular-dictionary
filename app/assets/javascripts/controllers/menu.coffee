app.controller 'menu', [
  '$scope',
  ($scope) ->
    $scope.menu = [
      name: 'Index'
      state: 'public.index'
    ,
      name: 'Dictionary'
      state: 'public.dictionary.index'
    ,
      name: 'About'
      state: 'public.about'
    ]
]
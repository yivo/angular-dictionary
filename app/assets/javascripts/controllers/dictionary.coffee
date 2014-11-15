app.controller 'dictionary', [
  '$scope', '$state', 'Filter', 'FilterRules',
  ($scope, $state, Filter, FilterRules) ->

    console.log 'Dictionary controller created'

    $scope.alphabet = ['a', 'b', 'c', 'e', 'g', 'j', 'l', 'm']

    $scope.rules = new FilterRules $scope
    filter = new Filter $scope, $scope.rules

    $scope.$on '$stateChangeSuccess', ->
      $scope.rules.query = $state.params.query
      console.log 'State successfully changed'

    filter.act()

]
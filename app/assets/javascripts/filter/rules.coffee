app.service 'FilterRules', [
  '$state', '$stateParams'
  ($state, $stateParams) ->

    class FilterRules

      constructor: ($scope) ->
        @updateState = _.after 2, @updateState.bind(@)
        $scope.$watch 'rules.query', @updateState

      updateState: ->
        console.log "Query changed. New query is #{@query}"
        if @query
          $state.go 'public.dictionary.search', query: @query
        else
          $state.go 'public.dictionary.index'

]
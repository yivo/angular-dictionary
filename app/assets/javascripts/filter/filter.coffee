app.service 'Filter',
  ->
    colors = ['amaranth', 'amber', 'amethyst', 'apricot', 'aquamarine', 'azure', 'baby blue', 'beige', 'black', 'blue', 'blue-green', 'blue-violet', 'blush', 'bronze', 'brown', 'burgundy', 'byzantium', 'carmine', 'cerise', 'cerulean', 'champagne', 'chartreuse green', 'chocolate', 'cobalt blue', 'coffee', 'copper', 'coral', 'crimson', 'cyan', 'desert sand', 'electric blue', 'emerald', 'erin', 'gold', 'gray', 'green', 'harlequin', 'indigo', 'ivory', 'jade', 'jungle green', 'lavender', 'lemon', 'lilac', 'lime', 'magenta', 'magenta rose', 'maroon', 'mauve', 'navy blue', 'ocher', 'olive', 'orange', 'orange-red', 'orchid', 'peach', 'pear', 'periwinkle', 'persian blue', 'pink', 'plum', 'prussian blue', 'puce', 'purple', 'raspberry', 'red', 'red-violet', 'rose', 'ruby', 'salmon', 'sangria', 'sapphire', 'scarlet', 'silver', 'slate gray', 'spring bud', 'spring green', 'tan', 'taupe', 'teal', 'turquoise', 'violet', 'viridian', 'white', 'yankees blue', 'yellow']

    class Filter

      constructor: (@$scope, @rules) ->
        @act = _.after 2, @act.bind(@)
        $scope.$watch 'rules', @act, yes

      act: ->
        q = @rules.query
        console.log "Filter will act. Query is #{q}"

        if q
          results = _.filter colors, (color) -> color.indexOf(q) is 0
        else results = colors

        change = => @$scope.colors = results

        if @$scope.$$phase then change()
        else @$scope.$apply change



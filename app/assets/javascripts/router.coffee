app.config [
  '$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->

    $stateProvider
      .state 'public',
        abstract : true
        url : ''
        templateUrl : 'layout.html'

      .state 'public.index',
        url : '/'
        templateUrl : 'index.html'
        controller : 'index'

      .state 'public.about',
        url : '/about'
        templateUrl : 'about.html'
        controller : 'about'

      .state 'public.dictionary',
        abstract : true
        url : '/dictionary'
        templateUrl : 'dictionary.html'
        controller : 'dictionary'

      .state 'public.dictionary.index',
        url : ''
        templateUrl : 'blocks/dictionary-content.html'

      .state 'public.dictionary.search',
        url : '/:query'
        templateUrl : 'blocks/dictionary-content.html'

    $urlRouterProvider.otherwise '/'

    $locationProvider.html5Mode
      enabled: true
      requireBase: false
      html5Mode: true

]
Expensify.factory 'Expense', ($http, $q) ->
  self = {}

  self.getExpenses = (scope) ->
    scope.searching = true
    scope.url = "/api/v1/expenses/"
    $http({method: 'GET', url: scope.url })
      .success (response) ->
        scope.searching = false
        scope.expenses = response

  self

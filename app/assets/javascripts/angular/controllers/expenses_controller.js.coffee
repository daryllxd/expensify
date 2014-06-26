Expensify.controller "ExpensesController", ($scope, $http) ->
  $scope.expenses = []
  $scope.currentExpense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.populateExpenses = () ->
    $scope.searching = true
    $scope.url = "/api/v1/expenses/"
    $http({method: "GET", url: $scope.url })
      .success (data) ->
        $scope.searching = false
        $scope.expenses = data

  $scope.clearExpense = () ->
    $scope.currentExpense = {}

  $scope.addExpense = () ->
    $scope.expenses.push( $scope.currentExpense )
    $scope.clearExpense()

  $scope.save = () ->
    $http({ method: "POST", url: $scope.url, data: $scope.currentExpense })
      .success (data) ->
        $scope.addExpense()
        $scope.populateExpenses()

  $scope.delete = (expense) ->
    $http({ method: "DELETE", url: expense.url})
      .success (response) ->
        $scope.populateExpenses()

Expensify.controller "ExpensesController", ($scope, $http) ->
  $scope.expenses = []
  $scope.currentExpense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.populateExpenses = () ->
    url = "/api/v1/expenses/"
    $http({method: "GET", url: url })
      .success (data) ->
        $scope.expenses = data

  $scope.clearExpense = () ->
    $scope.currentExpense = {}

  $scope.addExpense = () ->
    $scope.expenses.push( $scope.currentExpense )
    $scope.clearExpense()

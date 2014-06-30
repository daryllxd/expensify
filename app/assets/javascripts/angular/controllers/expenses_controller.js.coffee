Expensify.controller "ExpensesController", ($scope, Expense, $http) ->
  $scope.expenses = []
  $scope.currentExpense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.populateExpenses = () ->
    Expense.getExpenses($scope)

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

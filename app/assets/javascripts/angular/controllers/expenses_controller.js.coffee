Expensify.controller "ExpensesController", ($scope, Expense, $http, $q) ->
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

  $scope.testPromise = () ->
    deferred = $q.defer()

    promise = deferred.promise

    promise.then(
      (result) ->
        alert("Success: #{result}")
      (reason) ->
        alert("Error: #{reason}"))

    if($scope.fail)
      deferred.reject('sorry')
    else
      deferred.resolve('C00l')



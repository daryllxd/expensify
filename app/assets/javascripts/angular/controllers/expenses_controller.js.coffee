Expensify.controller "ExpensesController", ($scope, Expense, $http, $q) ->
  $scope.expenses = []
  $scope.currentExpense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.populateExpenses = () ->
    Expense.query().$promise.then (expenses) ->
      $scope.expenses = expenses

  $scope.clearExpense = () ->
    $scope.currentExpense = {}

  $scope.addExpense = () ->
    $scope.expenses.push( $scope.currentExpense )
    $scope.clearExpense()

  $scope.save = () ->
    if $scope.currentExpense.id?
      Expense.update($scope.currentExpense)
    else
      Expense.save($scope.currentExpense)
    $scope.currentExpense = {}
    $scope.populateExpenses()

  $scope.edit = (expense) ->
    $scope.currentExpense = Expense.get({id: expense.id })

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



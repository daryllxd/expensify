Expensify.controller "ExpensesController", ($scope, Expense, $http, $q) ->

  $scope.expenses = []
  $scope.currentExpense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.populateExpenses = () ->
    Expense.get(page: $scope.currentPage).$promise.then (response) ->
      $scope.expenses = response.expenses
      $scope.paging = response.meta
      $scope.createPages()

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
    expense.$delete()
    $scope.populateExpenses()

  $scope.setPage = (newPage) ->
    newPage = 1 if newPage < 1
    $scope.currentPage = newPage if newPage <= $scope.paging.number_of_pages
    $scope.populateExpenses()

  $scope.createPages = () ->
    $scope.pages = [1..$scope.paging.number_of_pages]

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



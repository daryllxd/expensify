Expensify.controller "ExpensesController", ($scope) ->
  $scope.expenses = []
  $scope.current_expense = {}
  $scope.categories = ['Food', 'Good', 'Mood']

  $scope.clear_expense = () ->
    $scope.current_expense = {}

  $scope.add_expense = () ->
    $scope.expenses.push( $scope.current_expense )
    $scope.clear_expense()

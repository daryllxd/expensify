Expensify.factory 'Expense', ($resource) ->
  $resource("/api/v1/expenses/:id")

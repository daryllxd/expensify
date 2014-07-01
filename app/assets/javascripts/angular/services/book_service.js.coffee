Expensify.factory 'Expense', ($resource) ->
  $resource("/api/v1/expenses/:id", { id: "@id" }, { update: { method: 'PUT' } } )

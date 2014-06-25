class Api::V1::ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    respond_to do |format|
      format.json { render json: @expenses }
    end
  end

  def create(params)
    @expense = Expense.new(params)

    if @expense.save
      render { json: @expense }
    else
      render { json: "whut" }
    end

  end

end

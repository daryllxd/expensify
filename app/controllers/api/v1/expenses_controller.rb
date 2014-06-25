class Api::V1::ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    respond_to do |format|
      format.json { render :json => @expenses }
    end
  end
end

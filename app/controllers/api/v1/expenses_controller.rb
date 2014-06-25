class Api::V1::ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    respond_to do |format|
      format.json { render :json => @expenses }
    end
  end

  def create
    Expense.create(allowed_params)
    respond_to do |format|
      format.json { render :json => 1 }
    end
  end

  def allowed_params
    params.permit(:name, :description, :category)
  end
end

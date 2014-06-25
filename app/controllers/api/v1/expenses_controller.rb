class Api::V1::ExpensesController < ApplicationController
  respond_to :json

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def create
    @expense = Expense.new(allowed_params)
    if @expense.save
      render json: @expense
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def allowed_params
    params.permit(:name, :description, :category)
  end
end

class Api::V1::ExpensesController < ApplicationController
  respond_to :json

  def show
    @book = Expense.where(allowed_params).first
    render json: @book, root: false
  end

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

  def destroy
    @expense = Expense.where(allowed_params)
    Expense.delete(@expense)

    render json: @expense, root: false
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(allowed_params)
    render json: @expense
  end

  def allowed_params
    params.permit(:id, :name, :description, :category)
  end
end

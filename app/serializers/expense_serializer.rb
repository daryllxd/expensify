class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :url

  def url
    api_v1_expense_path(object)
  end
end

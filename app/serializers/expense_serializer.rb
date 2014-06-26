class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category
end

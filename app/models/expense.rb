class Expense < ActiveRecord::Base
  validates_presence_of :name, :description, :category
end

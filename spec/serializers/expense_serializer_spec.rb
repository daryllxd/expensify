require 'spec_helper'

describe ExpenseSerializer do
  it 'creates JSON for the API' do
    serializer = ExpenseSerializer.new(Expense.new(
      id: 1,
      name: 'Foodies',
      description: 'Eating some food.',
      category: 'Food'
    ))
    expect(serializer.to_json).to eql('{"expense":{"id":1,"name":"Foodies","description":"Eating some food.","category":"Food"}}')

  end
end

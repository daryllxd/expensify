require 'spec_helper'

describe 'Expenses API' do
  context '#index' do
    it 'returns nothing when no expenses' do
      get '/api/v1/expenses', {}, { "Accept" => "application/json" }

      json = JSON.parse(response.body)
      expect(json).to eq []
    end

    it 'returns all expenses' do
      expense1 = create(:expense, name: 'Foodies')
      expense2 = create(:expense, name: 'Hoodies')
      get '/api/v1/expenses', {}, { "Accept" => "application/json" }

      json = JSON.parse(response.body)

      test_names = json.map { |x| x['name'] }
      expect(test_names).to eq ['Foodies', 'Hoodies']
    end
  end

  context '#create' do
    it 'creates the expense' do
      new_expense = attributes_for(:expense, name: 'Goodies')

      post '/api/v1/expenses', new_expense, { "Accept" => "application/json" }

      json = JSON.parse(response.body)
      expect(Expense.count).to eq 1
      expect(Expense.first.name).to eq 'Goodies'
      expect(json['name']).to eq 'Goodies'
    end

    it 'doesnt allow bad values' do
      new_expense = attributes_for(:expense, name: nil)

      post '/api/v1/expenses', new_expense, { "Accept" => "application/json" }

      expect(Expense.count).to eq 0
      expect(response.response_code).to eq 422
      expect(response.body).to include 'blank'
    end
  end
end

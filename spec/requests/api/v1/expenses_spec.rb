require 'spec_helper'

describe 'Expenses API' do
  context '#index' do
    it 'returns nothing when no expenses' do
      get '/api/v1/expenses', {}, { "Accept" => "application/json" }

      expect(json_response).to eq []
    end

    it 'returns all expenses' do
      expense1 = create(:expense, name: 'Foodies')
      expense2 = create(:expense, name: 'Hoodies')
      get '/api/v1/expenses', {}, { "Accept" => "application/json" }

      test_names = json_response.map { |x| x['name'] }
      expect(test_names).to eq ['Foodies', 'Hoodies']
    end
  end

  context '#create' do
    it 'creates the expense' do
      new_expense = attributes_for(:expense, name: 'Goodies')

      post '/api/v1/expenses', new_expense, { "Accept" => "application/json" }

      expect(Expense.count).to eq 1
      expect(Expense.first.name).to eq 'Goodies'
      expect(json_response['name']).to eq 'Goodies'
    end

    it 'doesnt allow bad values' do
      new_expense = attributes_for(:expense, name: nil)

      post '/api/v1/expenses', new_expense, { "Accept" => "application/json" }

      expect(Expense.count).to eq 0
      expect(response.response_code).to eq 422
      expect(json_response.to_s).to include 'can\'t be blank'
    end
  end
end

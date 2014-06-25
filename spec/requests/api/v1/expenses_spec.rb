require 'spec_helper'

describe 'Expenses API' do
  context '#index' do
    it 'returns nothing when no expenses' do
      get '/api/v1/expenses', {}, { "Accept" => "application/json" }

      json = JSON.parse(response.body)
      expect(json).to eq []
    end
  end
end

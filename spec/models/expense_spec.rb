require 'spec_helper'

describe Expense do
  context 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:category) }
  end

end

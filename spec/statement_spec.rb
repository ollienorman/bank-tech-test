require 'statement'

describe Statement do
  describe '#new_transaction' do
    it 'can create a new transaction object' do
      expect(subject.new_transaction).to be_a(Transaction)
    end
  end
end
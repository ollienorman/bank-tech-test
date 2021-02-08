require 'statement'

describe Statement do

  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject { described_class.new(transaction_class) }

  describe '#new_transaction' do
    it 'can create a new transaction object' do
      expect(subject.new_transaction).to eq transaction
    end
  end
end
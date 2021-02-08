require 'statement'

describe Statement do

  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject { described_class.new(transaction_class) }

  describe '#new_transaction' do
    it 'adds a new transaction to all_transactions' do
      subject.new_transaction
      expect(subject.all_transactions.first).to eq transaction
    end
  end

  describe '#print_statement' do
    it 'contains the correct header' do
      expect { subject.print_statement }.to output('date || credit || debit || balance').to_stdout
    end
  end
end
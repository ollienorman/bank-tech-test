require 'statement'

describe Statement do

  time = Time.new.strftime("%d/%m/%Y") 
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
      expect { subject.print_statement }
        .to output(a_string_including('date || credit || debit || balance'))
        .to_stdout
    end

    it 'contains the formatted transaction' do
      allow(transaction).to receive(:date).and_return(time)
      allow(transaction).to receive(:credit).and_return(1000)
      allow(transaction).to receive(:debit)
      allow(transaction).to receive(:balance).and_return(1000)
      subject.new_transaction
      expect { subject.print_statement }
        .to output(a_string_including("#{time} || 1000.00 || || 1000.00"))
        .to_stdout
    end
  end
end
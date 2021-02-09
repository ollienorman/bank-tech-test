# frozen_string_literal: true

require 'statement'

describe Statement do
  let(:transaction) { double :transaction, date: '01/01/2000', credit: 1000, debit: nil, balance: 1000 }
  let(:transaction_history) { double :transaction_history, all_transactions: [transaction] }
  let(:transaction_history_class) { double :transaction_history_class, new: transaction_history }
  subject { described_class.new(transaction_history_class) }

  describe '#print_statement' do
    it 'contains the correct header' do
      expect { subject.print_statement }
        .to output(a_string_including('date || credit || debit || balance'))
        .to_stdout
    end

    it 'contains the formatted transaction' do
      expect { subject.print_statement }
        .to output(a_string_including('01/01/2000 || 1000.00 || || 1000.00'))
        .to_stdout
    end
  end
end

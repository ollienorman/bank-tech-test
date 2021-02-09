# frozen_string_literal: true

require 'transaction_history'

describe TransactionHistory do
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject { described_class.new(transaction_class) }

  describe '#new_transaction' do
    it 'adds a new transaction to all_transactions' do
      subject.new_transaction
      expect(subject.all_transactions.first).to eq transaction
    end
  end

  describe '#account_balance' do
    it 'knows the current balance of the account' do
      subject.new_transaction(credit: 1000)
      subject.new_transaction(debit: 250)
      expect(subject.account_balance).to eq 750
    end
  end
end

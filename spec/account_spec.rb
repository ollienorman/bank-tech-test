# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_history) {double :transaction_history, new_transaction: true}
  let(:statement) { double :statement, transaction_history: transaction_history }
  let(:statement_class) { double :statement_class, new: statement }
  subject { described_class.new(statement_class) }

  describe '#deposit' do
    it 'allows money to be added to the account' do
      expect { subject.deposit('01/01/2000', 1000) }.to change { subject.balance }.by(1000)
    end

    it 'adds a new transaction to the accounts statement' do
      expect(subject.statement.transaction_history).to receive(:new_transaction).with(date: '01/01/2000', credit: 1000, balance: 1000)
      subject.deposit('01/01/2000', 1000)
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from the account' do
      subject.deposit('01/01/2000', 1000)
      expect { subject.withdraw('01/01/2000', 1000) }.to change { subject.balance }.by(-1000)
    end

    it 'adds a new transaction to the accounts statement' do
      expect(subject.statement.transaction_history).to receive(:new_transaction).with(date: '01/01/2000', debit: 1000, balance: -1000)
      subject.withdraw('01/01/2000', 1000)
    end
  end

  describe '#balance' do
    it 'has a default starting balance' do
      expect(subject.balance).to eq Account::STARTING_BALANCE
    end
  end
end

# frozen_string_literal: true

require 'account'

describe Account do
  time = Time.new.strftime("%d/%m/%Y")
  let(:transaction_history) {double :transaction_history, new_transaction: true}
  let(:statement) { double :statement, transaction_history: transaction_history }
  let(:statement_class) { double :statement_class, new: statement }
  subject { described_class.new(statement_class) }

  describe '#deposit' do
    it 'allows money to be added to the account' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'adds a new transaction to the accounts statement' do
      expect(subject.statement.transaction_history).to receive(:new_transaction).with(date: time, credit: 1000, balance: 1000)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from the account' do
      subject.deposit(1000)
      expect { subject.withdraw(1000) }.to change { subject.balance }.by(-1000)
    end

    it 'adds a new transaction to the accounts statement' do
      subject.deposit(1000)
      expect(subject.statement.transaction_history).to receive(:new_transaction).with(date: time, debit: 1000, balance: 0)
      subject.withdraw(1000)
    end

    it 'throws an error if not enough funds in the account' do
      expect { subject.withdraw(1) }.to raise_error "Not enough funds!"
    end
  end

  describe '#balance' do
    it 'has a default starting balance' do
      expect(subject.balance).to eq Account::STARTING_BALANCE
    end
  end
end

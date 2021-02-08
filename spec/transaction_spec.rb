# frozen_string_literal: true

require 'transaction'

describe Transaction do
  it 'contains a date' do
    expect(subject).to respond_to(:date)
  end

  it 'contains credit' do
    expect(subject).to respond_to(:credit)
  end

  it 'contains debit' do
    expect(subject).to respond_to(:debit)
  end

  it 'contains a balance' do
    expect(subject).to respond_to(:balance)
  end

  describe '#credit' do
    it 'returns to two decimal places if not nil' do
      transaction = Transaction.new(credit: 1000)
      expect(transaction.credit).to eq(1000.00)
    end

    it 'returns nil if nil' do
      transaction = Transaction.new
      expect(transaction.credit).to eq(nil)
    end
  end

  describe '#debit' do
    it 'returns to two decimal places if not nil' do
      transaction = Transaction.new(debit: 1000)
      expect(transaction.debit).to eq(1000.00)
    end

    it 'returns nil if nil' do
      transaction = Transaction.new
      expect(transaction.debit).to eq(nil)
    end
  end

  describe '#balance' do
    it 'returns to two decimal places if not nil' do
      transaction = Transaction.new(balance: 1000)
      expect(transaction.balance).to eq(1000.00)
    end

    it 'returns nil if nil' do
      transaction = Transaction.new
      expect(transaction.balance).to eq(nil)
    end
  end
end

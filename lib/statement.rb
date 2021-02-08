require 'transaction'

class Statement

  attr_reader :all_transactions

  def initialize(transaction = Transaction)
    @transaction = transaction
    @all_transactions = []
  end

  def new_transaction(date: nil, credit: nil, debit: nil, balance: nil)
    @all_transactions << @transaction.new(date: date, credit: credit, debit: debit, balance: balance)
  end

end
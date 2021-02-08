require 'transaction'

class Statement

  def initialize(transaction = Transaction)
    @transaction = transaction
    @all_transactions = []
  end

  def new_transaction(date: nil, credit: nil, debit: nil, balance: nil)
    @transaction.new(date, credit, debit, balance)
  end

end
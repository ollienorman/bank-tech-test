require_relative './transaction'

class Statement

  attr_reader :all_transactions

  def initialize(transaction = Transaction)
    @transaction = transaction
    @all_transactions = []
  end

  def new_transaction(date: nil, credit: nil, debit: nil, balance: nil)
    @all_transactions << @transaction.new(date: date, credit: credit, debit: debit, balance: balance)
  end

  def print_statement
    puts statement_header
    all_transactions.reverse.each { |transaction| puts transaction_formatter(transaction)}
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end

  def transaction_formatter(transaction)
    "#{transaction.date} || #{number_formatter(transaction.credit)}|| #{number_formatter(transaction.debit)}|| #{number_formatter(transaction.balance)}"
  end

  def number_formatter(number)
    number ? '%.2f' % number + " " : nil
  end
  
end

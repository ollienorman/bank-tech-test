# frozen_string_literal: true

require_relative './transaction_history'

class Statement

  attr_reader :transaction_history

  def initialize(transaction_history = TransactionHistory)
    @transaction_history = transaction_history.new
  end

  def print_statement
    puts statement_header
    @transaction_history.all_transactions.reverse.each { |transaction| puts transaction_formatter(transaction) }
  end

  private

  def statement_header
    'date || credit || debit || balance'
  end

  def transaction_formatter(transaction)
    "#{transaction.date} || #{number_formatter(transaction.credit)}|| #{number_formatter(transaction.debit)}|| #{number_formatter(transaction.balance)}"
  end

  def number_formatter(number)
    number ? '%.2f' % number + ' ' : nil
  end
end

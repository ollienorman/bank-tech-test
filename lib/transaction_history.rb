# frozen_string_literal: true

require_relative './transaction'

class TransactionHistory

  def initialize(transaction = Transaction)
    @transaction = transaction
  end

end

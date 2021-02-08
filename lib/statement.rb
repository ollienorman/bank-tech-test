require 'transaction'

class Statement

  def initialize(transaction = Transaction)
    @transaction = transaction
  end

  def new_transaction
    @transaction.new
  end

end
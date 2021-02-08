class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize
    @date = nil
    @credit = nil
    @debit = nil
    @balance = nil
  end

end
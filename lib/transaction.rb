class Transaction

  attr_reader :date, :credit, :debit, :balance

  def initialize(date: nil, credit: nil, debit: nil, balance: nil)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def credit
    '%.2f' % @credit
  end

end
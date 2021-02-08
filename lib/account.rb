require 'statement'

class Account

  STARTING_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(statement = Statement)
    @balance = STARTING_BALANCE
    @statement = statement.new
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end
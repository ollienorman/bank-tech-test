require_relative './statement'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(statement = Statement)
    @balance = STARTING_BALANCE
    @statement = statement.new
  end

  def deposit(date, amount)
    @balance += amount
    add_deposit_transaction(date, amount)
  end

  def withdraw(date, amount)
    @balance -= amount
    add_withdraw_transaction(date, amount)
  end

  private

  def add_deposit_transaction(date, amount)
    @statement.new_transaction(date: date, balance: @balance, credit: amount)
  end

  def add_withdraw_transaction(date, amount)
    @statement.new_transaction(date: date, balance: @balance, debit: amount)
  end
end

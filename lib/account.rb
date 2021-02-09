# frozen_string_literal: true

require_relative './statement'

class Account
  STARTING_BALANCE = 0

  attr_reader :balance, :statement

  def initialize(statement = Statement)
    @balance = STARTING_BALANCE
    @statement = statement.new
    @timestamp = Time.new.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    raise 'Cannot deposit negative amount' if amount.negative?
    
    @balance += amount
    add_deposit_transaction(amount)
  end

  def withdraw(amount)
    raise 'Cannot withdraw negative amount' if amount.negative?
    raise 'Not enough funds!' if amount > @balance

    @balance -= amount
    add_withdraw_transaction(amount)
  end

  private

  def add_deposit_transaction(amount)
    @statement.transaction_history.new_transaction(date: @timestamp, balance: @balance, credit: amount)
  end

  def add_withdraw_transaction(amount)
    @statement.transaction_history.new_transaction(date: @timestamp, balance: @balance, debit: amount)
  end
end

# frozen_string_literal: true

require 'account'

describe 'scenario' do
  it 'prints correct statement after three separate bank transactions' do
    account = Account.new
    account.deposit('10/01/2012', 1000)
    account.deposit('13/01/2012', 2000)
    account.withdraw('14/01/2012', 500)
    expect { account.statement.print_statement }.to output("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00 \n13/01/2012 || 2000.00 || || 3000.00 \n10/01/2012 || 1000.00 || || 1000.00 \n").to_stdout
  end
end

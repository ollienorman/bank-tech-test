require 'account'

describe Account do

  time = Time.new.strftime("%d/%m/%Y") 
  let(:statement) { double :statement, new_transaction: true }
  let(:statement_class) { double :statement_class, new: statement }
  subject { described_class.new(statement_class) }

  it 'contains a statement object' do
    expect(subject.statement).to eq statement
  end

  describe '#deposit' do
    it 'allows money to be added to the account' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'adds a new transaction to the accounts statement' do
      expect(subject.statement).to receive(:new_transaction).with(date: time, credit: 1000, balance: 1000)
      subject.deposit(1000)
    end
  end

  describe '#withdraw' do
    it 'allows money to be withdrawn from the account' do
      subject.deposit(1000)
      expect { subject.withdraw(1000) }.to change { subject.balance }.by(-1000)
    end
  end

  describe '#balance' do
    it 'has a default starting balance' do
      expect(subject.balance).to eq Account::STARTING_BALANCE
    end
  end
end
require 'account'

describe Account do
  describe '#deposit' do
    it 'allows money to be added to the account' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
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
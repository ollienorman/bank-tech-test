require 'account'

describe Account do
  describe '#deposit' do
    it 'allows money to be added to the account' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end
  end
end
require 'transaction'

describe Transaction do

  it 'contains a date' do
    expect(subject).to respond_to(:date)
  end

  it 'contains credit' do
    expect(subject).to respond_to(:credit)
  end

  it 'contains debit' do
    expect(subject).to respond_to(:debit)
  end

  it 'contains a balance' do
    expect(subject).to respond_to(:balance)
  end

  describe '#credit' do
    it 'returns to two decimal places if not nil' do
      transaction = Transaction.new(credit: 1000)
      expect(transaction.credit).to eq('1000.00')
    end
  end

end
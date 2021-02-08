require 'transaction'

describe Transaction do
  it '#contains a date' do
    expect(subject).to respond_to(:date)
  end

end
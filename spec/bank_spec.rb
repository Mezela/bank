require 'bank'

describe BankAccount do

  describe 'initialize' do
    it 'defaults to 0 when a new bank account is created' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'adds a deposit to the current balance' do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end
  end

end
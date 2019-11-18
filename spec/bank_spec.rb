require 'bank'
require 'date'

describe BankAccount do

  describe 'initialize' do
    it 'defaults to 0 when a new bank account is created' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'increases current balance' do
      subject.deposit(1000)
      expect(subject.balance).to eq 1000
    end

    it 'records the day of the transaction' do
      subject.deposit(1000)
      expect(subject.transactions).to eq [{ type: 'debit', amount: 1000, date: DateTime.now.strftime("%d/%m/%Y") }]
    end
  end

  describe '#withdraw' do
    it 'reduces current balance' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq 500
    end
  end

end
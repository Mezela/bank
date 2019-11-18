require 'bank_account'
require 'date'

describe BankAccount do

  describe 'initialize' do
    it 'defaults to 0 when a new bank account is created' do
      expect(subject.balance).to eq 0
    end
  end

  context 'depositing money to account' do
    describe '#deposit' do
      it 'increases current balance' do
        subject.deposit(1000)
        expect(subject.balance).to eq 1000
      end

      it 'records the type of transaction as debit' do
        subject.deposit(1000)
        expect(subject.transactions.first[:type]).to eq 'debit'
      end

      it 'records the date of transaction' do
        subject.deposit(1000)
        expect(subject.transactions.first[:date]).to eq DateTime.now.strftime("%d/%m/%Y")
      end

      it 'records the current balance after transaction' do
        subject.deposit(1000)
        expect(subject.transactions.first[:balance]).to eq 1000
      end
    end
  end

  context 'withdrawing money from account' do
    describe '#withdraw' do
      it 'reduces current balance' do
        subject.deposit(1000)
        subject.withdraw(500)
        expect(subject.balance).to eq 500
      end

      it 'records the type of transaction as credit' do
        subject.withdraw(500)
        expect(subject.transactions.first[:type]).to eq 'credit'
      end

      it 'records the date of transaction' do
        subject.withdraw(500)
        expect(subject.transactions.first[:date]).to eq DateTime.now.strftime("%d/%m/%Y")
      end

      it 'records the current balance after transaction' do
        subject.withdraw(500)
        expect(subject.transactions.first[:balance]).to eq -500
      end
  end

  end

end
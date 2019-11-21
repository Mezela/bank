# frozen_string_literal: true
require 'bank_account'
require 'date'

describe BankAccount do

  let(:account) { described_class.new }

  describe 'initialize' do
    it 'defaults to 0 when a new bank account is created' do
      expect(account.balance).to eq 0
    end
  end

  context 'depositing money to account' do
    describe '#deposit' do
      it 'increases current balance' do
        amount = 1000
        expect { account.deposit(amount) }.to change { account.balance }.by(amount)
      end

      it 'records the type of transaction as debit' do
        account.deposit(1000)
        expect(account.transactions_log.first.credit).to eq 1000.00
      end

      it 'records the date of transaction' do
        account.deposit(1000)
        expect(account.transactions_log.first.date).to eq DateTime.now.strftime('%d/%m/%Y')
      end

      it 'records the current balance after transaction' do
        account.deposit(1000)
        expect(account.transactions_log.first.balance).to eq 1000.00
      end
    end
  end

  context 'withdrawing money from account' do
    describe '#withdraw' do
      it 'error message if amount > balance' do
        expect(account.withdraw(500)).to include 'Insufficient balance'
      end

      it 'money not withdrawn if amount > balance' do
        account.deposit(100)
        expect{account.withdraw(500)}.to change {account.balance}.by(0)
      end

      it 'reduces current balance' do
        account.deposit(1000)
        withdrawal = 500
        expect { account.withdraw(withdrawal) }.to change { account.balance }.by(-withdrawal)
      end

      it 'records the type of transaction as credit' do
        account.deposit(1000)
        account.withdraw(500)
        expect(account.transactions_log.last.debit).to eq 500.00
      end

      it 'records the date of transaction' do
        account.deposit(1000)
        account.withdraw(500)
        expect(account.transactions_log.last.date).to eq DateTime.now.strftime('%d/%m/%Y')
      end
    end
  end
end

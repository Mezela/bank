# frozen_string_literal: true
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
        expect(subject.balance).to eq 1000.00
      end

      it 'records the type of transaction as debit' do
        subject.deposit(1000)
        expect(subject.transactions_log.first.type).to eq 'credit'
      end

      it 'records the date of transaction' do
        subject.deposit(1000)
        expect(subject.transactions_log.first.date).to eq DateTime.now.strftime('%d/%m/%Y')
      end

      it 'records the current balance after transaction' do
        subject.deposit(1000)
        expect(subject.transactions_log.first.balance).to eq 1000.00
      end
    end
  end

  context 'withdrawing money from account' do
    describe '#withdraw' do
      it 'records the current balance after transaction' do
        expect(subject.withdraw(500)).to include 'Insufficient balance'
      end

      it 'reduces current balance' do
        subject.deposit(1000)
        subject.withdraw(500)
        expect(subject.balance).to eq 500.00
      end

      it 'records the type of transaction as credit' do
        subject.deposit(1000)
        subject.withdraw(500)
        expect(subject.transactions_log.last.type).to eq 'debit'
      end

      it 'records the date of transaction' do
        subject.deposit(1000)
        subject.withdraw(500)
        expect(subject.transactions_log.last.date).to eq DateTime.now.strftime('%d/%m/%Y')
      end
    end
  end
end

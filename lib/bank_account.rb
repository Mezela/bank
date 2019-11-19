# frozen_string_literal: true
require 'date'
require_relative 'bank_transaction'

class BankAccount
  attr_reader :balance, :transactions_log
  INITIAL_BALANCE = 0.00

  def initialize(transaction = BankTransaction)
    @balance = INITIAL_BALANCE
    @transaction = transaction
    @transactions_log = []
  end

  def deposit(money)
    debit_to_account(money)
    add_transaction_to_log(@transaction.new(type: 'credit', amount: money, balance: balance))
  end

  def withdraw(money)
    return "Insufficient balance. Only #{@balance} left in your account." if insufficient_balance?(money)

    credit_to_account(money)
    add_transaction_to_log(@transaction.new(type: 'debit', amount: money, balance: balance))
  end

  private

  def debit_to_account(money)
    @balance += money
  end

  def credit_to_account(money)
    @balance -= money
  end

  def insufficient_balance?(request)
    (@balance - request).negative?
  end

  def add_transaction_to_log(transaction)
    @transactions_log << transaction
  end
end

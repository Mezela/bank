require 'date'

class BankAccount
  attr_reader :balance, :transactions
  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = []
  end
  
  def deposit(money)
    @balance += money
    @transaction = { type: 'debit', amount: money, date: DateTime.now.strftime("%d/%m/%Y"), balance: @balance }
    @transactions << @transaction
  end

  def withdraw(money)
    @balance -=money
    @transaction = { type: 'credit', amount: money, date: DateTime.now.strftime("%d/%m/%Y"), balance: @balance }
    @transactions << @transaction
  end

end
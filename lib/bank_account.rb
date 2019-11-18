require 'date'

class BankAccount
  attr_reader :balance, :transactions
  INITIAL_BALANCE = 0.00

  def initialize
    @balance = INITIAL_BALANCE
    @transactions = []
  end

  def deposit(money)
    debit_to_account(money)
    record_transaction(@balance, money, 'credit')
  end

  def withdraw(money)
    return "Insufficient balance. Only #{@balance} left in your account." if insufficient_balance?(money)
    credit_to_account(money)
    record_transaction(@balance, money, 'debit')
  end

  def record_transaction(balance, money, type)
    money_string = ("%.2f" % money).to_s
    balance_string = ("%.2f" % balance).to_s
    transaction = { type: type , amount: money_string, date: DateTime.now.strftime("%d/%m/%Y"), balance: balance_string }
    @transactions << transaction
  end

  private 

  def debit_to_account(money)
    @balance += money
  end

  def credit_to_account(money)
    @balance -= money
  end

  def insufficient_balance?(request)
    return true if @balance - request < 0
  end

end
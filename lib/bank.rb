class BankAccount
  attr_reader :balance
  INITIAL_BALANCE = 0

  def initialize
    @balance = INITIAL_BALANCE
  end
  
  def deposit(money)
    @balance += money
  end

  def withdraw(money)
    @balance -=money
  end

end
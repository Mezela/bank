require_relative 'bank_account'

class BankStatement
  attr_reader :account

  def initialize(account = BankAccount.new)
    @account = account
  end

  def print_statement
    p "date || credit || debit || balance"
  end

end
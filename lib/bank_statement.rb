require_relative 'bank_account'

class BankStatement
  attr_reader :account

  def initialize(account = BankAccount.new)
    @account = account
  end

  def print_statement
    statement = ""
    statement << "date || credit || debit || balance"
    if !@account.transactions.empty? 
      @account.transactions.each do |transaction|
        if transaction[:type] == "credit"
          statement << "\n" + transaction[:date] + " || " + transaction[:amount] + " || || " + transaction[:balance]
        else
          statement << "\n" + transaction[:date] + " || || " + transaction[:amount] + " || " + transaction[:balance]
        end
      end
    end
    p statement
    return statement
  end

end
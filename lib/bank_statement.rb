
require_relative 'bank_account'

class BankStatement
  attr_reader :account

  def initialize(account = BankAccount.new)
    @account = account
    @statement = ''
  end

  def print_statement
    statement_header
    unless @account.transactions_log.empty?
      @account.transactions_log.reverse.each do |transaction|
        list_each_transaction(transaction)
      end
    end
    return statement
  end

  private

  attr_accessor :statement

  def statement_header
    statement << 'date || credit || debit || balance'
  end

  def list_each_transaction(transaction)
    if transaction[:type] == 'credit'
      statement << '\n' + transaction[:date] + ' || ' + transaction[:amount] + ' || || ' + transaction[:balance]
    else
      statement << '\n' + transaction[:date] + ' || || ' + transaction[:amount] + ' || ' + transaction[:balance]
    end
  end
end

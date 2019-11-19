require_relative 'bank_account'

class BankStatement
  attr_reader :account

  def initialize(account = BankAccount.new)
    @account = account
    @statement = 'date || credit || debit || balance'
  end

  def print_statement
    @account.transactions_log.reverse.each do |transaction|
      list_each_transaction(transaction)
    end
    return @statement
  end

  private

  attr_accessor :statement

  def format_two_decimal(num)
    ('%.2f' % num).to_s
  end

  def list_each_transaction(transaction)
    if transaction[:type] == 'credit'
      @statement << "\\n#{transaction[:date]} || #{format_two_decimal(transaction[:amount])} || || #{format_two_decimal(transaction[:balance])}"
    else
      @statement << "\\n#{transaction[:date]} || || #{format_two_decimal(transaction[:amount])} || #{format_two_decimal(transaction[:balance])}"
    end
  end
end


require_relative 'bank_account'

class BankStatement
  attr_reader :account

  def initialize(account = BankAccount.new)
    @account = account
    @statement = 'date || credit || debit || balance'
  end

  def print_statement
    @account.transactions_log.reverse.each do |t|
      list_each_transaction(t)
    end
    puts @statement
  end

  private

  attr_accessor :statement

  def format(num)
    (('%.2f' % num).to_s+" ") if num.is_a?(Numeric)
  end

  def list_each_transaction(t)
    
    @statement << "\n#{t.date} || #{format(t.credit)}|| #{format(t.debit)}|| #{format(t.balance)}"
  end
end



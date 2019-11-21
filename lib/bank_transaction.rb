# frozen_string_literal: true

require 'date'

class BankTransaction
  attr_reader :date, :credit, :debit, :balance 
  def initialize(credit:, debit:, balance:, date: DateTime.now.strftime('%d/%m/%Y'))
    @credit = credit
    @debit = debit
    @balance = balance
    @date = date
  end
end

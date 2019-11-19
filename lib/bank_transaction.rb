# frozen_string_literal: true

require 'date'

class BankTransaction
  attr_reader :date, :type, :balance, :amount  
  def initialize(type:, amount:, balance:, date: DateTime.now.strftime('%d/%m/%Y'))
    @type = type
    @amount = amount
    @balance = balance
    @date = date
  end
end

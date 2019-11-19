# frozen_string_literal: true

require 'bank_transaction'
require 'date'

describe BankTransaction do  
  describe 'date' do
    it "a transaction will default to today's date" do
      transaction = BankTransaction.new(type: 'credit', amount: 500, balance: 1000)
      expect(transaction.date).to eq DateTime.now.strftime('%d/%m/%Y')
    end
  end
end

# frozen_string_literal: true

require 'bank_statement'
require 'date'

describe BankStatement do  
  describe '#print_statement' do
    context 'single transaction' do

      let(:transaction1) { double('transaction', debit: false, credit: 1000, date: "21/11/2019", balance: 1000 ) }
      let(:account) { double('account', transactions_log: [transaction1]) }
      let(:statement) { BankStatement.new(account) }

      it 'returns the statement for one deposit of 1000' do
        message = "date || credit || debit || balance\n21/11/2019 || 1000.00 || || 1000.00 \n"
        expect{statement.print_statement}.to output(message).to_stdout
      end    
    end

    context 'two transactions recorded on statement in reverse' do
      let(:transaction1) { double('transaction', debit: false, credit: 1000, date: "21/11/2019", balance: 1000 ) }
      let(:transaction2) { double('transaction2', credit: false, debit: 500, date: "22/11/2019", balance: 500 ) }
      let(:account2) { double('account', transactions_log: [transaction1, transaction2]) }
      let(:statement2) { BankStatement.new(account2) }

      it 'returns the statement for one deposit of 1000 and withdrawal of 500' do
        message = "date || credit || debit || balance\n22/11/2019 || || 500.00 || 500.00 \n21/11/2019 || 1000.00 || || 1000.00 \n"

        expect{statement2.print_statement}.to output(message).to_stdout
      end
    end
  end
end
